<?php
require_once 'openCon.php';
$pid = file_get_contents("php://input");


$query = "SELECT max(id) as maxlinha FROM modelo";

$result = mysqli_query($con,$query);
if($result){
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    echo $row['maxlinha']+1;
}