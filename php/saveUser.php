<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';

$data = file_get_contents("php://input");
$dt = json_decode($data);





if(isset($dt->id)){
        $query = sprintf("UPDATE users SET nome='%s', username='%s', password='%s',type=%s "
            . " WHERE id=%s "
            ,$dt->nome,$dt->username,$dt->password,$dt->type ,$dt->id);
} else {
    $query = sprintf("INSERT INTO users(nome,username,password,type) "
            . "  VALUES('%s','%s','%s',%s)"
           , $dt->nome,$dt->username,$dt->password,$dt->type);
}


$result = mysqli_query($con,$query);
if($result){
    echo 'Ok';
} else{
    echo $query;
}