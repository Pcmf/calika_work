<?php
require_once 'openCon.php';
$json = file_get_contents("php://input");
$dt= json_decode($json);

     $ano = substr($dt->pedido->ano, 2, 2);
    
    $query = sprintf("SELECT MAX(SUBSTR(refinterna,LENGTH((SELECT codigo FROM cliente WHERE id=%s))+1)) as maxlinha FROM modelo WHERE refinterna LIKE '%s' "
            , $dt->pedido->clienteId,$dt->clt->codigo.$ano.'%'); 
    
   // $query = sprintf("SELECT MAX(SUBSTR(refinterna,LENGTH((SELECT codigo FROM cliente WHERE id=%s))+1)) as maxlinha FROM modelo WHERE refinterna LIKE '%s' ",$dt->pedido->clienteId,$dt->clt->codigo.'%');

    $result = mysqli_query($con,$query);
    if($result){
        $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
        if($row['maxlinha']>0){
            echo $row['maxlinha']+1;
        } else {
           // echo substr($dt->pedido->ano,-2).$dt->clt->valorinicial;
 		echo substr($dt->pedido->ano,-2).'101';
        }
        
    } else {
        echo substr($dt->pedido->ano,-2).$dt->clt->valorinicial;
    }

