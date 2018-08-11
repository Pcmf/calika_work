app = angular.module('appCalika',['ngRoute','ngResource','angularFileUpload','ui.bootstrap','ngTable']);

app.config(function($routeProvider){
        $routeProvider
            .when('/config',{templateUrl:'views/config.html',controller:'configController'})
            .when('/client',{templateUrl:'views/client.html',controller:'clientController'})
            .when('/list/:id',{templateUrl:'views/orders.html',controller:'ordersController'})
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
});