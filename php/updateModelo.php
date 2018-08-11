<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';

$data = file_get_contents("php://input");
$modelo = json_decode($data);


!isset($modelo->preco)?$modelo->preco=0:null;
!isset($modelo->escala->id)?$escala=0:$escala=$modelo->escala->id;
//
$resp = array();
//Grava modelo ou atualiza(?)


    $query = sprintf("UPDATE modelo SET  descricao='%s',mainimg='%s', imagens='%s',preco=%s,escala=%s "
            . " WHERE id=%s"
            ,$modelo->descricao,$modelo->mainimg, json_encode($modelo->imagens),$modelo->preco,$escala,$modelo->id);
		
		$result = mysqli_query($con,$query);
		if($result){
			$resp['tipo'] = 'OK';
			$resp['valor'] = $modelo->mainimg;
		} else{
			$resp['tipo'] = 'Erro';
		    $resp['valor'] = 'Erro no update linha 29';
		}



echo json_encode($resp);
  


