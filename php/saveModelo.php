<?php

/* 
 * Guarda o modelo criado associado a um pedido
 */
require_once 'openCon.php';

$data = file_get_contents("php://input");
$parm = json_decode($data);

$modelo = $parm->modelo;
$artigo = $modelo->a;

!isset($modelo->preco)?$modelo->preco=0:null;
!isset($modelo->escala->id)?$escala=0:$escala=$modelo->escala->id;
//
$resp = array();
//Grava modelo ou atualiza(?)

    $query = sprintf("INSERT INTO modelo(ano,refinterna,refcliente,pedido,artigo,pasta,mainimg,descricao,preco,escala)"
            . " VALUES(%s,'%s','%s',%s,%s,'%s','%s','%s',%s,%s)"
           ,$parm->ano,$modelo->refinterna,$modelo->refcliente,$parm->temaId,$artigo->id,$modelo->folder,$modelo->mainimg,
           $modelo->descricao, $modelo->preco,$escala);
	
    $result = mysqli_query($con,$query);
    if($result){
        echo mysqli_insert_id($con);
    } else{
        echo $query;
    }