app = angular.module('appCalika',['ngRoute','ngResource','angularFileUpload','ui.bootstrap','ngTable']);

app.config(function($routeProvider){
        $routeProvider
            .when('/config',{templateUrl:'views/config.html',controller:'configController'})
            .when('/client',{templateUrl:'views/client.html',controller:'clientController'})
            .when('/list/:id',{templateUrl:'views/orders.html',controller:'ordersController'})
            .when('/fillord/:id',{templateUrl:'views/fillord.html',controller:'fillordController'})
            .when('/newTema/:cid',{templateUrl:'views/tema.html',controller:'temaController'})
            .when('/tema/:cid/:pid',{templateUrl:'views/tema.html',controller:'temaController'})
            .otherwise({templateUrl:'views/dashboard.html',controller:'dashboardController'});
});

//Controller for Navbar
app.controller('mainController',function($scope,$http){
    $http({
        url:'php/getClients.php',
        method:'GET'
    }).then(function(answer){
        $scope.clients = answer.data;
    });
    if(sessionStorage.userData){
        $scope.tipo = JSON.parse(sessionStorage.userData).tipo
        $scope.nome = JSON.parse(sessionStorage.userData).nome
    }
    $scope.logout = function(){
        window.sessionStorage.clear();
        $http({
            url:'php/logout.php'
        });
        window.location.replace('index.php');
    }
    
});

app.controller('loginCntrl', function($scope,$http){
       //Check login
       $scope.validUser = false;
    window.sessionStorage.clear();
    $scope.error = '';

    $scope.login = function(u){
        $http({
            url:'php/checkUser.php',
            method: 'POST',
            data:JSON.stringify({'username':u.userName,'pwd':u.pwd})
        }).then(function(resposta){
          if(resposta.data.aviso !== undefined){
            if(resposta.data.aviso == ""){
                $scope.aviso = "";
                window.sessionStorage.userData = JSON.stringify(resposta.data.user);
                $scope.userData = resposta.data.user;
                window.location.replace('main.php');
                
            } else {
                $scope.aviso = resposta.data.aviso;
            }
        } else{
            $scope.error = 'Problema na base de dados. Por favor contacte o suporte.';
        }
        });            
    }; 

});
