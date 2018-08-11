<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once 'openCon.php';

$resp = array();


$result0  = mysqli_query($con,"SELECT * FROM cliente");
if($result0){
    while ($row0 = mysqli_fetch_array($result0,MYSQLI_ASSOC)) {
        $result = mysqli_query($con,sprintf("SELECT S.situacao, count(*) AS qty FROM pedido P INNER JOIN situacao S ON P.situacao =S.id "
                . " WHERE clienteId = %s GROUP BY P.situacao ORDER BY P.situacao", $row0['id']));
        
        if($result){
            $orders = array();
            while ($row = mysqli_fetch_array($result,MYSQLI_ASSOC)) {
                array_push($orders, $row);
//                echo $row['situacao'];
            }
            $row0['orders']= $orders;
        }
        array_push($resp, $row0);
    }
    // Free result set
    mysqli_free_result($result);

    mysqli_close($con);
    echo json_encode($resp);
}

