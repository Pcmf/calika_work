<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';
$json = file_get_contents("php://input");
$dt= json_decode($json);

//Apagar os dados existentes
mysqli_query($con,"TRUNCATE emailservico");

//Insere os novos dados
$result = mysqli_query($con, sprintf("INSERT INTO emailservico(email,pass,host,emaildestino) VALUES('%s','%s','%s','%s')",
            $dt->email,$dt->pass,$dt->host,$dt->emaildestino));
if($result){
    echo 'Dados Alterados';
} else {
    echo 'Erro';
}

