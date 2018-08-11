<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';
$data = file_get_contents("php://input");
$dt = json_decode($data);
$parm= json_decode($dt->params);




$result = mysqli_query($con,"SELECT * FROM ".$parm->fx." WHERE id =".$parm->id);

if($result){
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    echo json_encode($row);
}
