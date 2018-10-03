/* 
 * Listar os pedidos que já foram produzidos
 */
angular.module('appCalika').controller('closedController',function($scope,$http,$routeParams,NgTableParams){
    
    
    
    getOrders();
    
    //Botão para voltar atrás
    $scope.voltarAtras5 = function(pid){
        $http({
            url:'php/updateStatus.php',
            method:'POST',
            data:JSON.stringify({'pid':pid,'status':5})
        }).then(function(answer){
            getOrders();
        })
    }
    
    
    function getOrders(){
        $http({
        url:'php/getClosedOrderByClient.php',
        method:'POST',
        data:$routeParams.id
    }).then(function(answer){
       var data = answer.data;
            $scope.paramsTable = new NgTableParams({
               },{
                   dataset:data
               });       
    });
    }
    
});

