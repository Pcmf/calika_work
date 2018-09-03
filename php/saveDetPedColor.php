<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once 'openCon.php';
$data = file_get_contents('php://input');
$dt = json_decode($data);
//$qtys = $dt->qtys;
$cor1 = $dt->cor1;
(isset($dt->cor2))? $cor2 = $dt->cor2 : $cor2 = '';
(isset($dt->e1))? $e1 = $dt->e1 : $e1 = '';
(isset($dt->e2))? $e2 = $dt->e2 : $e2 = '';
(isset($dt->e3))? $e3 = $dt->e3 : $e3 = '';

$ln = 1;
$resp = array();
//first has to check if this modelo already has lines
$result0 = mysqli_query($con,sprintf("SELECT max(linha) AS nlinhas FROM detpedcor WHERE pedido=%s AND modelo=%s",$dt->pid,$dt->mid));
if($result0){
    $row0 = mysqli_fetch_array($result0,MYSQLI_ASSOC);
    if($row0['nlinhas']>0){
        $ln = $row0['nlinhas']+1;
    }
}

$query = sprintf("INSERT INTO detpedcor(pedido,modelo,linha,cor1,cor2,elem1,elem2,elem3)"
        . " VALUES(%s,%s,%s,'%s','%s','%s','%s','%s')",
        $dt->pid,$dt->mid,$ln,json_encode($cor1),json_encode($cor2), json_encode($e1),
 json_encode($e2), json_encode($e3));
$result = mysqli_query($con,$query);
if($result){
    $result1 = mysqli_query($con,sprintf("SELECT * FROM detpedcor "
            . " WHERE pedido=%s AND modelo=%s",$dt->pid,$dt->mid));
    if($result1){
        while ($row1 = mysqli_fetch_array($result1,MYSQLI_ASSOC)) {
            $row1['cor1'] = json_decode($row1['cor1']);
            $row1['cor2'] = json_decode($row1['cor2']);
            $row1['elem1'] = json_decode($row1['elem1']);
            $row1['elem2'] = json_decode($row1['elem2']);
            $row1['elem3'] = json_decode($row1['elem3']);
           // $row1['qtys'] = json_decode($row1['qtys']);
            array_push($resp, $row1);
        }
        echo json_encode($resp);
    }
} else {
    echo $query;
}