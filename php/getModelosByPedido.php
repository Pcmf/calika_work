<?php

/* 
 * Devolve a lista de modelos de um dado pedido
 */
require_once 'openCon.php';
$pid = file_get_contents("php://input");

$resp = array();

$result0 = mysqli_query($con, sprintf("SELECT M.*,A.nome FROM detalhepedido D "
        . " INNER JOIN modelo M ON M.id=D.modelo "
        . " INNER JOIN artigo A ON A.id=M.artigo "
        . " WHERE D.pedido=%s",$pid));
if($result0){
    while ($row = mysqli_fetch_array($result0,MYSQLI_ASSOC)) {
        array_push($resp, $row);
    }
    echo json_encode($resp);
}
        
