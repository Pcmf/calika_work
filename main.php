<!DOCTYPE html>
<?php
    session_start();
    if( !isset($_SESSION['valid_ID']) || $_SESSION['valid_ID']==false ){
          header('Location: index.php');
          die();
    }
?>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html ng-app="appCalika">
    <head>
        <meta charset="UTF-8">
        <title>BackOffice</title>
        
        <link rel="icon" type="image/png" href="favicon-32x32.png" sizes="32x32" />
        
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <script src="lib/jquery.min.js" type="text/javascript"></script>
        <link href="lib/bootstrap.3.3.7/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="lib/bootstrap.toggle.2.2.0/bootstrap-toggle.css" rel="stylesheet" type="text/css"/>
        <script src="lib/bootstrap3.3.6/bootstrap.min.js" type="text/javascript"></script>
        <link href="lib/fontAwesome.4.7.0/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="lib/angular.1.6.6.min.js" type="text/javascript"></script>
        <script src="lib/angularjs-1.6.6-angular-route.js" type="text/javascript"></script>
        <link href="lib/ng-table.min.css" rel="stylesheet" type="text/css"/>
        <script src="lib/ng-table.min.js" type="text/javascript"></script> 
        <script src="lib/angular-file-upload.js" type="text/javascript"></script>
        <script src="lib/angular-resource.js" type="text/javascript"></script>
        <script src="lib/ImageTools.js" type="text/javascript"></script>

        <!--a linha a baixo é utilizada para mostrar o modal-->
        <link href="lib/bootstrap.3.3.7/uibootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.js"></script> 
       
        
        <script src="js/appCalika.js" type="text/javascript"></script>
        <script src="js/dashboard.js" type="text/javascript"></script>
        <script src="js/config.js" type="text/javascript"></script>
        <script src="js/client.js" type="text/javascript"></script>
        <script src="js/orders.js" type="text/javascript"></script>
        <script src="js/tema.js" type="text/javascript"></script>
        <script src="js/fillord.js" type="text/javascript"></script>
        <script src="js/users.js" type="text/javascript"></script>
        <script src="js/concluidos.js" type="text/javascript"></script>
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
    </head>
    <body ng-controller="mainController">
        <nav class="navbar navbar-inverse">
          <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">CALIKA</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                  <!--Configurações-->
                <li></li>
                <!--Manutenção-->
                <li class="dropdown">
                  <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Manutenção <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="#!/client">Clientes</a></li>
                    <li><a href="#!/config/">Configurações</a></li>
                    <li ng-if="tipo==0"><a href="#!/users/">Utilizadores</a></li>
                  </ul>
                </li>
              </ul>
                
                <!-- Para ir para o inicio -->
                <ul class="nav navbar-nav right">
                    <li><a href="#">Inicio</a></li>
                <!--</ul>-->               
                <!-- Para ver os que já foram fechados -->
                <!--<ul class="nav navbar-nav right">-->
                    <li><a href="#!/closed/{{cid}}">Concluidos</a></li>
                </ul>                 
                <!-- user log out á direita -->
                <ul class="nav navbar-nav mr">
                    <li><a href="" ng-click="logout()"><i class="fa fa-user"></i> {{nome}}</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
            

          </div><!-- /.container-fluid -->
        </nav>
        <!--Main View-->
        <div ng-view=""></div>
        <h3>&nbsp;</h3>
        <!--Footer-->
        <footer class="navbar navbar-fixed-bottom bg-info" style="padding-top: 15px;">
            <div class="container text-center">
                <em>Copyright <span class="fa fa-copyright"></span>
                    2017 - Calika Baby. All rights reserved. Design by 
                    <a href="pedroferreira2005@gmail.com" target="_blank">Pcmf</a>
                </em>
            </div>
        </footer>
        
    </body>
</html>
