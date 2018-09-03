<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once 'openCon.php';

$json = file_get_contents("php://input");
$dt = json_decode($json);

//remove model from detalhepedido e detpedcor
$query = sprintf("DELETE FROM detpedcor WHERE pedido=%s AND modelo=%s",$dt->pid,$dt->mid);
$result = mysqli_query($con,$query);
if($result){

        $query2 =sprintf("DELETE FROM modelo WHERE id=%s",$dt->mid);
        $result2=mysqli_query($con,$query2);
        if($result2){
            echo 'Ok';
        } else{
            echo $query2;
        }

} else {
    echo $query;
}