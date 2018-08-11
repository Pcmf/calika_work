/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

angular.module('appCalika').controller('ordersController',function($scope,$http,$routeParams,NgTableParams){
    $scope.cid = $routeParams.id;
    //Get cliente 
    $http({
        url:'php/getDataFxId.php',
        method:'POST',
        data:{params:JSON.stringify({'fx':'cliente','id':$scope.cid})}
    }).then(function(resp){
        $scope.clt = resp.data;
    });


    //get Orders by client
    $http({
        url:'php/getOrderByClient.php',
        method:'POST',
        data:{params:$scope.cid}
    }).then(function(answer){
        var data = answer.data;
        $scope.paramsTable = new NgTableParams({
           },{
               dataset:data
           });       
    });
    
    
    //PHP para imprimir folhas de detalhe para pedido - para ser preenchido manualmente
    $scope.docForClient = function(pid){
        $http({
            url:'php/docForClient.php',
            method:'POST',
            data:pid
        }).then(function(answer){
            alert('Foi criada documentação para imprimir');
        });
        
    };
    //Funções de ordenação da tabela
    $scope.sort = function (predicate) {
        $scope.predicate = predicate;
    };
    $scope.isSorted = function (predicate) {
        return ($scope.predicate == predicate);
    };    
});
