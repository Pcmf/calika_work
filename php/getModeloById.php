<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';
$data = file_get_contents("php://input");
$dt = json_decode($data);
$id = $dt->params;

$resp = array();


$query = sprintf("SELECT M.*,A.nome AS nomeArtigo, E.nome AS nomeEscala "
        . " FROM modelo M "
        . " INNER JOIN artigo A ON M.artigo = A.id "
        . " INNER JOIN escala E ON  E.id = M.escala "
        . " WHERE M.id=%s",$id);
        
$result = mysqli_query($con,$query);
if ($result){
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    echo json_encode($row);
} else {
    echo $query;
}
        
