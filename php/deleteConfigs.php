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
        $query = sprintf("DELETE FROM cor WHERE id=%s",$ob->iCor);
    }
}
if($fx =='elemento'){
    if(isset($ob->id)){ //update
        $query = sprintf("DELETE FROM elemento WHERE id=%s",$ob->id);
    } 
}
if($fx =='embalagem'){
    if(isset($ob->iEmb)){ //update
        $query = sprintf("DELETE FROM embalagem WHERE id=%s",$ob->iEmb);
    }
}
if($fx =='artigo'){
    if(isset($ob->iArt)){
        //check if is in use
        $result0 = mysqli_query($con,sprintf("SELECT count(*) AS num FROM modelo WHERE artigo=%s",$ob->iArt));
        if($result0){
            $row0 = mysqli_fetch_array($result0,MYSQLI_ASSOC);
            if($row0['num']>0){
                echo 'Não é possivel apagar este artigo porque já foi usado.';
                return;
            } else {
                $query = sprintf("DELETE FROM artigo WHERE id=%s",$ob->iArt);
            }
        } else {
           echo 'Erro no artigo.';
           return;
        }
    }
}

if($fx =='linha'){
    if(isset($ob->iLin)){ 
        $query = sprintf("DELETE FROM linha WHERE id=%s",$ob->iLin);
    }
}


$result = mysqli_query($con,$query);

if($result){
    echo 'Ok';
} else {
    echo $result;
}