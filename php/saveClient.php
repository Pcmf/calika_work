<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';

$data = file_get_contents("php://input");
$dt = json_decode($data);
$a = json_decode($dt->params);




if(isset($a->id)){
        $query = sprintf("UPDATE cliente SET codigo='%s', nome='%s', email='%s', contacto='%s',responsavel='%s',"
            . " pasta='%s', logo='%s' "
            . " WHERE id=%s"
            ,$a->codigo,$a->nome,$a->email,$a->contacto,$a->responsavel,'logos',$a->logo,$a->id);
} else {
    $query = sprintf("INSERT INTO cliente(codigo,valorinicial,nome,email,contacto,responsavel,pasta,logo)"
            . " VALUES('%s',%s,'%s','%s','%s','%s','%s','%s')"
           , $a->codigo,$a->valorinicial,$a->nome,$a->email,$a->contacto,$a->responsavel,'logos',$a->logo);
}

  


$result = mysqli_query($con,$query);
if($result){
    echo 'Ok';
} else{
    echo $query;
}