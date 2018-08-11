<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once 'openCon.php';

$resp = array();

$query = "SELECT M.*, A.nome, C.nome AS cnome FROM modelo M INNER JOIN artigo A ON M.artigo = A.id"
        . " INNER JOIN cliente C ON M.cliente = C.id";



$result = mysqli_query($con,$query);
if($result){
    while ($row = mysqli_fetch_array($result,MYSQLI_ASSOC)) {
        array_push($resp, $row);
    }
    echo json_encode($resp);
} else {
    echo 'ERRO';
}

