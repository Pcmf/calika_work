<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';

$data = file_get_contents("php://input");
$dt = json_decode($data);



//necessita de verificar se já está presente noutras tabelas ou é feito pelo mysql relations ??

$query = sprintf("DELETE FROM users WHERE id = %s",$dt->id);

$result = mysqli_query($con,$query);
if($result){
    echo 'Ok';
} else{
    echo 'Erro';
}