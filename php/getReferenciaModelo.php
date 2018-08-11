<?php
require_once 'openCon.php';
$pid = file_get_contents("php://input");


$query = sprintf("SELECT max(linha) as maxlinha FROM detalhepedido WHERE pedido=%s",$pid);

$result = mysqli_query($con,$query);
if($result){
	$row = mysqli_fetch_array($result,MYSQLI_ASSOC);
	if( $row['maxlinha']> 0){
		echo $row['maxlinha']+1;
		return;
	}
}
echo 1;