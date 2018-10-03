<?php session_start();

require_once 'openCon.php';
$data = file_get_contents("php://input");
$dt = json_decode($data);


$resp = array();
$user = array();
$result = mysqli_query($con,sprintf("SELECT * FROM users WHERE username='%s' AND password='%s' ",$dt->username, $dt->pwd));

if($result){
	$row = mysqli_fetch_array($result,MYSQLI_ASSOC);
	if($row['id']>0){
 		$_SESSION['valid_ID'] = true;
                $resp['user']= $row;
		$resp['aviso'] = "";
	} else{
		$resp['aviso']  = 'Erro no utilizador ou na password!\n Verifique e tente outra vez.';
	}
} else {
	$resp['aviso']  = 'Erro no utilizador ou na password!\n Verifique e tente outra vez.';
}

echo json_encode($resp);