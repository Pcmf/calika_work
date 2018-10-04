<?php
session_start();

require_once 'fpdf.php';
require_once 'openCon.php';
define('EURO',chr(128));

$data = file_get_contents("php://input");
$pid = json_decode($data);

$pdf = new FPDF();
$pdf->AliasNbPages();

//Aceder aos dados do pedido - recebe o id como parametro
$query0 = sprintf("SELECT P.*, C.nome AS cnome,C.pasta,C.logo "
        . " FROM pedido P "
        . " INNER JOIN cliente C ON P.clienteId=C.id "
        . " WHERE P.id=%s",$pid);
$result0 = mysqli_query($con,$query0);
if($result0){
   $row0 = mysqli_fetch_array($result0,MYSQLI_ASSOC); 
   $query = sprintf("SELECT M.*,A.nome FROM  modelo M "
           . " INNER JOIN artigo A ON A.id=M.artigo "
           . " WHERE M.pedido=%s",$pid);
   $result = mysqli_query($con,$query);
   if($result){
       while ($row = mysqli_fetch_array($result,MYSQLI_ASSOC)) {
           
// Para cada modelo cria uma pagina
            $pdf->AddPage();

            //Criar cabeçalho
            $pdf->Image('../../calika/img/'.$row0['folder'].'/'.$row0['imagem'], 10,8 ,0,15);
            $pdf->Image('../../calika/img/'.$row0['pasta'].'/'.$row0['logo'], 160,8 ,25);
            $pdf->SetFont('Times','B',12);
            $pdf->MultiCell(0,12,utf8_decode('FOLHA DA CONFEÇÃO'),0,'C');
            $pdf->Ln(1);
            $pdf->SetFont('Times','',10);
            $pdf->MultiCell(0,8,utf8_decode($row0['cnome']));
            $pdf->MultiCell(0,6,'Tema: '.utf8_decode($row0['tema']).'  Modelo: '.utf8_decode($row['nome']));
            $pdf->MultiCell(0,6,'Referencia do Cliente: '.utf8_decode($row['refcliente']));            
            $pdf->MultiCell(0,6,'Referencia Interna: '.utf8_decode($row['refinterna']));
            
            
            //Imagem principal - Verificar se existem mais imagens
            //Gerir o tamanho de acordo com a quantidade de imagens existentes
            $imagens = json_decode($row['imagens']);
            if(sizeof($imagens)>=0){
                $y = $pdf->GetY();
                $pdf->SetY($y+10);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$row['mainimg'], 10, $y+10, 0,40);
            }


            //Descrição - Abaixo da imagem principal
            $pdf->SetY($y+50);
            //CRIAR A TABELA - Cabeçalho
            $pdf->Ln(8);
            $tw = [15,22,8]; //Largura das colunas Cor / elem / escala
            $pdf->SetFillColor(217,237,247);
            $pdf->SetFont('', 'B');
            $pdf->Cell($tw[0], 4, 'Cor 1',1,0,'C',true);
            $pdf->Cell($tw[0], 4, 'Cor 2',1,0,'C',true);
            $pdf->Cell($tw[1], 4, 'Elem 1',1,0,'C',true);
            $pdf->Cell($tw[1], 4, 'Elem 2',1,0,'C',true);
            $pdf->Cell($tw[1], 4, 'Elem 3',1,0,'C',true);
            $query1= sprintf("SELECT tamanhos FROM escala WHERE id=%s",$row['escala']);
            $result1=mysqli_query($con,$query1);
            if($result1){
                $row1 = mysqli_fetch_array($result1,MYSQLI_ASSOC);                    
                $tamanhos = explode(',',$row1['tamanhos']);
                foreach ($tamanhos as $t){
                    $pdf->Cell($tw[2],4,$t,1,0,'C',true);
                }
            }
            
            //Dados para a tabela
            $pdf->SetFont('Times','',8);
            
            $query2 = sprintf("SELECT * FROM detpedcor WHERE pedido=%s AND modelo=%s",$pid,$row['id']);
            $result2 = mysqli_query($con,$query2);
            if($result2){
                $qtyTotal = 0;
                while ($row2 = mysqli_fetch_array($result2,MYSQLI_ASSOC)) {
                    $pdf->Ln(4);
                    //Cores
                    $cor1 = json_decode($row2['cor1']);
                    $pdf->Cell($tw[0], 4, $cor1->nome,1,0,'L');
                    $corT = json_decode($row2['cor2']);
                    (isset($corT->nome))? $cor2 = $corT->nome: $cor2 = "";
                    $pdf->Cell($tw[0], 4, $cor2,1,0,'L');
                    //Elementos
                    $elemT = json_decode($row2['elem1']);
                    (isset($elemT->elemento->nome))? $elem1 = $elemT->elemento->nome: $elem1 = "";
                    (isset($elemT->corElem->nome))? $elem1 .= '/'.$elemT->corElem->nome: null;
                    $pdf->Cell($tw[1], 4, utf8_decode($elem1),1,0,'L');
                    $elemT = json_decode($row2['elem2']);
                    (isset($elemT->elemento->nome))? $elem2 = $elemT->elemento->nome: $elem2 = "";
                    (isset($elemT->corElem->nome))? $elem2 .= '/'.$elemT->corElem->nome: null;
                    $pdf->Cell($tw[1], 4, utf8_decode($elem2),1,0,'L');
                    $elemT = json_decode($row2['elem3']);
                    (isset($elemT->elemento->nome))? $elem3 = $elemT->elemento->nome: $elem3 = "";
                    (isset($elemT->corElem->nome))? $elem3 .= '/'.$elemT->corElem->nome: null;
                    $pdf->Cell($tw[1], 4, utf8_decode($elem3),1,0,'L');
                    //Quantidades por tamanhos
                    $qtys = json_decode($row2['qtys']);
                    foreach ($tamanhos as $t){
                        if(isset($qtys->$t)){
                            $pdf->Cell($tw[2],4,$qtys->$t,1,0,'C');
                            $qtyTotal += $qtys->$t;
                        } else {
                           $pdf->Cell($tw[2],4,'',1,0,'C'); 
                        }
                    }
                }
              
            }
            //OBSERVAÇÕES
            $pdf->Ln(10);
            $pdf->MultiCell(0, 8, utf8_decode('OBSERVAÇÕES'));
            $pdf->Ln(1);
            $pdf->MultiCell(180, 5, utf8_decode($row['obscliente']),1, 'L', false);
           
            //Inserir Tabela 2 Linhas
            $pdf->Ln(10);
            $pdf->SetFillColor(217,237,247);
            $pdf->SetFont('', 'B');
            $pdf->Cell(26, 6, 'Entrada Linha',1,0,'C',true);
            $pdf->Cell(26, 6, 'Data Saida',1,0,'C',true);
            $pdf->Cell(26, 6, utf8_decode('Produção Media'),1,0,'C',true);
            $pdf->Cell(26, 6, 'Qtd Pedido',1,0,'C',true);
            $pdf->Cell(26, 6, 'Custo Feitio',1,0,'C',true);
            $pdf->Cell(26, 6, 'Total',1,0,'C',true);
            $pdf->Cell(26, 6, '',1,0,'C',true);
                   
            $pdf->Ln();
            $pdf->SetFillColor(255,255,255);
            $pdf->Cell(26, 10,'',1,0,'C',true);
            $pdf->Cell(26, 10,'',1,0,'C',true);
            $pdf->Cell(26, 10, '',1,0,'C',true);
            $pdf->Cell(26, 10, '',1,0,'C',true);
            $pdf->Cell(26, 10, '',1,0,'C',true);
            $pdf->Cell(26, 10, '',1,0,'C',true);
            $pdf->Cell(26, 10, '',1,0,'C',true);            

            
    //Notas - possivelmente o texto virá da BD
            $pdf->Ln(10);
            $pdf->MultiCell(0, 8, utf8_decode('NOTAS:'));
            $pdf->Ln(1);
            $pdf->Cell(180, 30, '',1, 2,'', false);
            
    //Insere uma quebra de pagina para imprimir as imagens no verso
            $pdf->AddPage();
            
            if(sizeof($imagens)==0){
                $y = $pdf->GetY();
                $pdf->SetY($y+10);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$row['mainimg'], 10, $y+10, 0,120);
            }   
            if(sizeof($imagens)==1){
                $y = $pdf->GetY();
                $pdf->SetY($y+10);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$row['mainimg'], 10, $y+10, 85,0);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$imagens[0], 100, $y+10, 85,0);
            }
            if(sizeof($imagens)==2){
                $y = $pdf->GetY();
                $pdf->SetY($y+10);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$row['mainimg'], 10, $y+10, 85,0);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$imagens[0], 100, $y+10, 45,0);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$imagens[1], 150, $y+10, 45,0);
            }
            if(sizeof($imagens)==3){
                $y = $pdf->GetY();
                $pdf->SetY($y+10);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$row['mainimg'], 10, $y+10, 85,0);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$imagens[0], 100, $y+10, 45,0);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$imagens[1], 150, $y+10, 45,0);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$imagens[2], 100, $y+65, 45,0);
            } 
            if(sizeof($imagens)>=4){
                $y = $pdf->GetY();
                $pdf->SetY($y+10);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$row['mainimg'], 10, $y+10, 85,0);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$imagens[0], 100, $y+10, 45,0);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$imagens[1], 150, $y+10, 45,0);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$imagens[2], 100, $y+65, 45,0);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$imagens[3], 150, $y+65, 45,0);
            } 
            
    
       } //Fim do ciclo principal - pedido/modelo
   }    

//$pdf->Output();

$doc = '../doc/Confecao_'.$row0['clienteId'].'_'.$row0['ano'].'_'.$row0['tema'].'.pdf';
$pdf->Output($doc,'F');

}
echo 'doc/Confecao_'.$row0['clienteId'].'_'.$row0['ano'].'_'.$row0['tema'].'.pdf';


