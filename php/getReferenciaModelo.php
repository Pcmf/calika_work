<?php
require_once 'openCon.php';
$json = file_get_contents("php://input");
$dt= json_decode($json);

    
    
    $query = sprintf("SELECT MAX(SUBSTR(refinterna,LENGTH((SELECT codigo FROM cliente WHERE id=%s))+1)) as maxlinha FROM modelo WHERE pedido=%s ",$dt->pedido->clienteId,$dt->pedido->id);

    $result = mysqli_query($con,$query);
    if($result){
        $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
        if($row['maxlinha']>0){
            echo $row['maxlinha']+1;
        } else {
            echo substr($dt->pedido->ano,-2).$dt->pedido->refInterna.'1';
        }
        
    } else {
        echo substr($dt->pedido->ano,-2).'1';
    }

