<?php

/* 
 * Apaga o pedido depois de remover do detpedcor e do modelo.
 * 
 */

require_once 'openCon.php';
$pid = file_get_contents("php://input");
echo $pid;

$result = mysqli_query($con, sprintf("DELETE FROM detpedcor WHERE pedido=%s",$pid));
if($result){
    $result1 = mysqli_query($con, sprintf("DELETE FROM modelo WHERE pedido=%s",$pid));
    if($result1){
        $result2 = mysqli_query($con, sprintf("DELETE FROM pedido WHERE id=%s",$pid));
    } else {
        echo "Não foi possivel anular este pedido(erro2)";
    }
} else {
    echo "Não foi possivel anular este pedido(erro1)";
}