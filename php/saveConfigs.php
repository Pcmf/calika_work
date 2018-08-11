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
$fx = $parm->fx;
$ob = $parm->ob;



if($fx =='cor'){
    if(isset($ob->iCor)){ //update
        $query = sprintf("UPDATE cor SET nome='%s', ref='%s' WHERE id=%s",$ob->nCor,$ob->rCor,$ob->iCor);
    } else {
       $query = sprintf("INSERT INTO cor(nome,ref) VALUES('%s','%s')",$ob->nCor,$ob->rCor); 
    }
}
if($fx =='elemento'){
    (!isset($ob->descricao) ? $ob->descricao='':null);
    if(isset($ob->id)){ //update
        $query = sprintf("UPDATE elemento SET nome='%s', descricao='%s' WHERE id=%s",$ob->nome,$ob->descricao,$ob->id);
    } else {
       $query = sprintf("INSERT INTO elemento(nome,descricao) VALUES('%s','%s')",$ob->nome,$ob->descricao); 
    }
}
if($fx =='embalagem'){
    if(isset($ob->iEmb)){ //update
        $query = sprintf("UPDATE embalagem SET nome='%s', descricao='%s' WHERE id=%s",$ob->nEmb,$ob->dEmb,$ob->iEmb);
    } else {
       $query = sprintf("INSERT INTO embalagem(nome,descricao) VALUES('%s','%s')",$ob->nEmb,$ob->dEmb); 
    }
}
if($fx =='artigo'){
    if(isset($ob->iArt)){ //update
        $query = sprintf("UPDATE artigo SET nome='%s' WHERE id=%s",$ob->nArt,$ob->iArt);
    } else {
       $query = sprintf("INSERT INTO artigo(nome) VALUES('%s')",$ob->nArt); 
    }
}

if($fx =='linha'){
    if(isset($ob->iLin)){ //update
        $query = sprintf("UPDATE linha SET cor='%s', ref='%s' WHERE id=%s",$ob->cLin,$ob->rLin,$ob->iLin);
    } else {
       $query = sprintf("INSERT INTO linha(ref,cor) VALUES('%s','%s')",$ob->rLin,$ob->cLin); 
    }
}


$result = mysqli_query($con,$query);

if($result){
    echo 'Ok';
} else {
    echo $result;
}