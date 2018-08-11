<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';

$fxs =['artigo','cor','elemento','embalagem','linha'];


$answer = array();


foreach ($fxs as $fx) {
    $data = array();
    $result = mysqli_query($con,"SELECT * FROM ".$fx);
    if($result){
        while ($row = mysqli_fetch_array($result,MYSQLI_ASSOC)) {
            array_push($data, $row);
        }
        $answer[$fx] = $data;
    }
}



echo json_encode($answer);