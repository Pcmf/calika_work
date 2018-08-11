<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';

$data = file_get_contents("php://input");
$dt = json_decode($data);
$parm = json_decode($dt->params);
$modelo = $parm->modelo;
$artigo = $modelo->a;

!isset($modelo->preco)?$modelo->preco=0:null;
!isset($modelo->escala->id)?$escala=0:$escala=$modelo->escala->id;
//
$resp = array();
//Grava modelo ou atualiza(?)

    $query = sprintf("INSERT INTO modelo(ano,refinterna,pedido,artigo,pasta,mainimg,descricao,preco,escala)"
            . " VALUES(%s,'%s',%s,%s,'%s','%s','%s',%s,%s)"
           ,$parm->ano,$modelo->refinterna,$parm->temaId,$artigo->id,$modelo->folder,$modelo->mainimg,
           $modelo->descricao, $modelo->preco,$escala);

    //Se inseriu um modelo tem de inserir tambem no detalhe do pedido
		
		$result = mysqli_query($con,$query);
		if($result){
			$mid = mysqli_insert_id($con);
			//Obter nº de linha
			$newLinha = 0;
			$result0 = mysqli_query($con,sprintf("SELECT max(linha) as lstlinha from detalhepedido where pedido=%s",$parm->temaId));
			if($result0){
				$row0 = mysqli_fetch_array($result0,MYSQLI_ASSOC);
				if($row0['lstlinha']>=0){
					$newLinha = $row0['lstlinha'] +1;
				}
			}
			$query1 = sprintf("INSERT INTO detalhepedido(pedido,linha,modelo) VALUES(%s,%s,%s)",$parm->temaId,$newLinha,$mid);
			$result1 = mysqli_query($con,$query1);
			if($result1){
				$resp['tipo']= 'OK';
				$resp['valor'] = $modelo->mainimg;
				$resp['id'] = $mid;
			} else{
				$resp['tipo']= 'Erro';
				$resp['valor'] =  "Erro linha 58 ".$query1;
			}
		} else{
			$resp['tipo']= 'Erro';
		    $resp['valor'] = 'Erro na linha 61 \n'.$query;
		}



echo json_encode($resp);
  


