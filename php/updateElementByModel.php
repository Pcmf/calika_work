 <?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';
$data = file_get_contents('php://input');
$dt = json_decode($data);



$query = sprintf("UPDATE detpedcor SET ".$dt->elemnum."='%s' WHERE pedido=%s AND modelo=%s AND linha=%s", json_encode($dt->element), $dt->pid, $dt->mid,$dt->linha);

$result = mysqli_query($con,$query);
if($result){
    echo 'Ok';
} else {
    echo $query;
}

