<?php
session_start();

require_once 'class.phpmailer.php';
require_once 'class.smtp.php';
require_once 'openCon.php';

//$json= file_get_contents("php://input");


//Aceder aos dados do Cliente para obter o email
$result1 = mysql_query(sprintf("SELECT * FROM cliente WHERE id = %s",$row0['clienteId']));
if($result1){
    $rowC = mysql_fetch_array($result1);
}

//Enviar o email


$mail = new PHPMailer();

$mail->isSMTP();
$mail->Host = 'smtp.gmail.com';
$mail->SMTPAuth = true;
$mail->Username = 'pedroferreira2005@gmail.com';
$mail->Password = 'pcmf@3315';
$mail->SMTPSecure = 'tls';


$mail->From =  'pedroferreira2005@gmail.com';
$mail->addAddress($rowC['email']);
$mail->addBCC('pedroferreira2005@gmail.com');


$mail->Subject = 'Pedidos Calika Baby '.date('d-m-Y');
$mail->isHTML(TRUE);
$mail->Body = '<h2>A copia do pedido segue em anexo.</h2><br/><br/>  Cumprimentos,<br/><b>  Rui Gomes</b>';
$mail->WordWrap = 50;
//$path = '../DocToCliente/DocCliente_'.$row0['clienteId'].'_'.$row0['ano'].'_'.$row0['nome'].'.pdf';

$mail->addAttachment($path);


if(!$mail->send()){
    return 'Erro no envio! Mailer error: '.$mail->ErrorInfo;
} else { 
    return 'Mensagem enviada com sucesso.';
}


