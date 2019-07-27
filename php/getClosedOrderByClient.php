<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';
$clt = file_get_contents("php://input");



$resp = array();

$query = sprintf("SELECT P.*, S.situacao AS status, C.codigo, M.refinterna AS ref"
        . " FROM pedido P "
        . " JOIN cliente C ON C.id = P.clienteID "
        . " JOIN situacao S ON P.situacao = S.id "
        . " INNER JOIN modelo M ON  M.pedido=P.id AND M.ano=P.ano"
        . " WHERE P.clienteId = %s AND P.situacao>=6 GROUP BY tema",$clt);

$result = mysqli_query($con,$query);
if ($result){
    while ($row = mysqli_fetch_array($result,MYSQLI_ASSOC)) {
        array_push($resp, $row);
    }
    echo json_encode($resp);
} else {
    echo $query;
}
        
