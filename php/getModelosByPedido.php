<?php

/* 
 * Devolve a lista de modelos de um dado pedido
 */
require_once 'openCon.php';
$pid = file_get_contents("php://input");
$resp = array();

$query =sprintf("SELECT M.*,A.nome FROM modelo M "
        . " INNER JOIN artigo A ON A.id=M.artigo "
        . " WHERE M.pedido=%s",$pid);

$result0 = mysqli_query($con, $query);
if($result0){
    while ($row = mysqli_fetch_array($result0,MYSQLI_ASSOC)) {
        array_push($resp, $row);
    }
    echo json_encode($resp);
} else {
    echo $query;
}
        
