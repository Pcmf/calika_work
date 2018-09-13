<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';
$json= file_get_contents("php://input");
$dt = json_decode($json);
$resp =array();

if(!isset($dt->tema->refcliente)){
    $refcliente ='';
} else {
    $refcliente = $dt->tema->refcliente;
}

//Cria o pedido/Tema
$query = sprintf("INSERT INTO pedido(clienteId,ano,refCliente,tema,folder,imagem,datapedido,situacao) "
        . " VALUES(%s,%s,'%s','%s','temas','%s',NOW(),1)", 
        $dt->clt->id,$dt->tema->ano,$refcliente,$dt->tema->tema,$dt->imagem);
$result= mysqli_query($con, $query);
if($result){
    $result1= mysqli_query($con, sprintf("SELECT * FROM pedido WHERE id=%s",mysqli_insert_id($con)));
    if($result1){
        echo json_encode(mysqli_fetch_array($result1,MYSQLI_ASSOC));
    }
}
