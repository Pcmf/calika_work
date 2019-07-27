<?php
session_start();
require_once 'class.phpmailer.php';
require_once 'class.smtp.php';
require_once 'fpdf.php';
require_once 'openCon.php';
define('EURO',chr(128));

$data = file_get_contents("php://input");
$pid = json_decode($data);

$pdf = new FPDF();
$pdf->AliasNbPages();

$ref ='';
//Aceder aos dados do pedido - recebe o id como parametro
$query0 = sprintf("SELECT P.*, C.nome AS cnome,C.pasta,C.logo "
        . " FROM pedido P "
        . " INNER JOIN cliente C ON P.clienteId=C.id "
        . " WHERE P.id=%s",$pid);
$result0 = mysqli_query($con,$query0);
if($result0){
   $row0 = mysqli_fetch_array($result0,MYSQLI_ASSOC); 
   $query = sprintf("SELECT M.*,A.nome FROM modelo M "
           . " INNER JOIN artigo A ON A.id=M.artigo "
           . " WHERE M.pedido=%s",$pid);
  // echo $query;
   $result = mysqli_query($con,$query);
   if($result){
       while ($row = mysqli_fetch_array($result,MYSQLI_ASSOC)) {
           
// Para cada modelo cria uma pagina
            $pdf->AddPage();

            //Criar cabeçalho
            $pdf->Image('../../calika/img/calikaLogo.png', 10,8 ,20);
            $pdf->Image('../../calika/img/'.$row0['folder'].'/'.$row0['imagem'], 100,18 ,0,15);
            $pdf->Image('../../calika/img/'.$row0['pasta'].'/'.$row0['logo'], 160,8 ,25);
            $pdf->SetFont('Times','B',12);
            $pdf->MultiCell(0,12,utf8_decode('Tema: '.utf8_decode($row0['tema'])),0,'C');
            $pdf->Ln(1);
            $pdf->SetFont('Times','',10);
            $pdf->MultiCell(0,6,'  Modelo: '.utf8_decode($row['nome']));
            $pdf->MultiCell(0,6,'Referencia do Cliente: '.utf8_decode($row['refcliente']));
            $pdf->MultiCell(0,6,'Referencia Interna: '.utf8_decode($row['refinterna']));
            $pdf->MultiCell(0,7,utf8_decode('Preço: '.$row['preco'].' Eur'));
            $pdf->MultiCell(0, 6, date('d-m-Y'));
            
            $ref = $row['refinterna'];
            //Imagem principal
            $y = $pdf->GetY();
            $pdf->SetY($y+5);
            $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$row['mainimg'], 10, $y+10, 0,50);

            //Descrição - ao lado da imagem principal
            $pdf->SetY($y);
            $pdf->SetX(90);
            $pdf->SetFont('Times','',10);
            $pdf->MultiCell(60,8,utf8_decode('Descrição: '));
            $pdf->SetXY(90, $y+10);
            $pdf->SetFont('Times','',8);
            $pdf->MultiCell(100,4,utf8_decode($row['descricao']),1,'L');
            $y = $pdf->GetY();
            $pdf->SetXY(10, $y+50);
            //CRIAR A TABELA para preencher as cores / elementos e tamanhos - Cabeçalho
            $pdf->Ln(8);
            $tw = [50,80]; //Largura das colunas Cor / elem / escala
            $pdf->SetFillColor(217,237,247);
            $pdf->SetFont('', 'B');
            $pdf->Cell(100, 6, '',0,0,'C',false);
            $pdf->Cell($tw[1],6,'Tamanhos',1,0,'C',true);
            $pdf->Ln();
            $pdf->Cell($tw[0], 6, 'Cores',1,0,'C',true);
            $pdf->Cell($tw[0], 6, 'Elementos',1,0,'C',true);
            for($i=0;$i<10;$i++){
               $pdf->Cell(8,6,'',1,0,'C',true);         
            }
            //Cria 10 linhas vazias para preenchimento manual
            for($k=0;$k<=10;$k++){
                $pdf->Ln();
                $pdf->Cell($tw[0], 8, '',1,0,'C',false);
                $pdf->Cell($tw[0], 8, '',1,0,'C',false);
                for($i=0;$i<10;$i++){
                   $pdf->Cell(8,8,'',1,0,'C',false);         
                }               
            }

            //OBSERVAÇÕES
            $pdf->Ln(8);
            $pdf->MultiCell(0, 8, utf8_decode('OBSERVAÇÕES'));
            $pdf->Ln(1);
            $pdf->Cell(180, 30, '',1, 2,'', false);
           
            
    //Insere uma quebra de pagina para imprimir as imagens no verso
            $pdf->AddPage();
            $imagens = json_decode($row['imagens']);
            if(sizeof($imagens)==0){
                $y = $pdf->GetY();
                $pdf->SetY($y+10);
                $pdf->Image('../../calika/img/'.$row['pasta'].'/'.$row['mainimg'], 10, $y+10, 0,160);
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

$doc = '../doc/DC'. date('d-m-Y').'_'.$ref.'.pdf';
$pdf->Output($doc,'F');



$path = 'doc/DC'. date('d-m-Y').'_'.$ref.'.pdf';
mysqli_query($con, sprintf("UPDATE pedido SET situacao=2, doc4client='%s' WHERE id=%s ",$path,$pid));
echo 'doc/DC'. date('d-m-Y').'_'.$ref.'.pdf';
}

//$result001 = mysqli_query($con, sprintf("SELECT * FROM emailservico"));
//if($result001){
//    $row001 = mysqli_fetch_array($result001,MYSQLI_ASSOC);
//
////Enviar o email
//
//
//$mail = new PHPMailer();
//
//$mail->isSMTP();
//$mail->Host = $row001['host'];
//$mail->SMTPAuth = true;
//$mail->Username = $row001['email'];
//$mail->Password = $row001['pass'];
//$mail->SMTPSecure = 'tls';
//
//
//$mail->From = $row001['email'];
//$mail->addAddress($row001['emaildestino']);
//
//
//$mail->Subject = 'Folha do pedido. Cliente: '.$row0['cnome'].'  Tema: '.$row0['tema'];
//$mail->isHTML(TRUE);
//$mail->Body = '<h2>A copia do pedido segue em anexo.</h2><br/><br/>  Cumprimentos,<br/><b>  Rui Gomes</b>';
//$mail->WordWrap = 50;
////$path = '../DocToCliente/DocCliente_'.$row0['clienteId'].'_'.$row0['ano'].'_'.$row0['nome'].'.pdf';
//
//$mail->addAttachment('../'.$path);
//
//
//if(!$mail->send()){
//    echo 'Erro no envio! Mailer error: '.$mail->ErrorInfo;
//} else { 
//    echo 'doc/DC'. date('d-m-Y').'_'.$ref.'.pdf';
//    //return 'Mensagem enviada com sucesso.';
//}
//
//} else {
//    echo "ERRO! O email de serviço não está configurado!";
//}







