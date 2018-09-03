<?php

/* 
 * Recebe pedido e novo status e atualiza 
 */

require_once 'openCon.php';
$json = file_get_contents("php://input");
$dt = json_decode($json);

mysqli_query($con, sprintf("UPDATE pedido SET situacao=%s WHERE id=%s",$dt->status,$dt->pid));
return;
