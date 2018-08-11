<?php

//Open connections to DB.
        $con = mysqli_connect("localhost","root","","calika");
        if (mysqli_connect_errno())
        {
            die('Could not connect: ' . mysql_error());
            echo'<h1>Não ligou</h1>';
        }
     //   mysql_select_db("calika", $con);
                
        mysqli_query($con,"SET NAMES 'utf8'");
        mysqli_query($con,'SET character_set_connection=utf8');
        mysqli_query($con,'SET character_set_client=utf8');
        mysqli_query($con,'SET character_set_results=utf8');
        
?>
