<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';
$data = file_get_contents("php://input");
$dt = json_decode($data);

//Read imagens from modelo 

$result0 = mysql_query(sprintf("SELECT imagens FROM modelo WHERE id =%s",$dt->mid));
if($result0){
	$row0 = mysql_fetch_array($result0);
	$arrayImg = json_decode($row0['imagens']);
	
	$idx = array_search($dt->img, $arrayImg);
	unset($arrayImg[$idx]);

	//update row in modelo
	if(sizeof($arrayImg)>0){
		$imagens = json_encode($arrayImg);
	} else{
		$imagens = '';
	}
	$result = mysql_query(sprintf("UPDATE modelo SET imagens='%s' WHERE id=%s", $imagens,$dt->mid));
}
return;


