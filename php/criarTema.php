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

!isset($dt->tema->refcliente)?$refCliente=NULL:$refCliente=$dt->tema->refcliente;
//Se a referencia interna não estiver definida vai buscar a anterior e incrementa
//Se não existir anterior começa a criar - vai buscar o ref inicial
if(!isset($dt->tema->refinterna)){
    $result0= mysqli_query($con, sprintf("SELECT max(refInterna)+1 FROM pedido WHERE clienteId=%s "
            . " AND id=(SELECT max(A.id) FROM pedido A WHERE A.clienteId=%s AND A.ano=%s)",$dt->clt->id,$dt->clt->id,$dt->tema->ano));
    if($result0){
        $row0 = mysqli_fetch_array($result0,MYSQLI_NUM);
        //$refInterna = $dt->clt->codigo.(($dt->tema->ano)*1000+$row0[0]);
    }
} else{
    $refinterna = $dt->t->refinterna;
}

$query = sprintf("INSERT INTO pedido(clienteId,ano,refInterna,refCliente,tema,folder,imagem,datapedido,situacao) "
        . " VALUES(%s,%s,'%s','%s','%s','temas','%s',NOW(),1)", 
        $dt->clt->id,$dt->tema->ano,$row0[0],$refCliente,$dt->tema->tema,$dt->imagem);
$result= mysqli_query($con, $query);
if($result){
    $result1= mysqli_query($con, sprintf("SELECT * FROM pedido WHERE id=%s",mysqli_insert_id($con)));
    if($result1){
        echo json_encode(mysqli_fetch_array($result1,MYSQLI_ASSOC));
    }
}

