<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';
$data = file_get_contents("php://input");
$dt = json_decode($data);
$clt = $dt->params;

$resp = array();

$query = sprintf("SELECT P.*, S.situacao AS status, C.codigo FROM pedido P "
        . " JOIN cliente C ON C.id = P.clienteID "
        . " JOIN situacao S ON P.situacao = S.id "
        . " WHERE P.clienteId = %s AND P.situacao<7",$clt);

$result = mysqli_query($con,$query);
if ($result){
    while ($row = mysqli_fetch_array($result,MYSQLI_ASSOC)) {
        $row['ref'] = $row['codigo'].((($row['ano'])*1000)+$row['refInterna']);
        array_push($resp, $row);
    }
    echo json_encode($resp);
} else {
    echo $query;
}
        
