/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

angular.module('appCalika').controller('ordersController',function($scope,$rootScope,$http,$routeParams,NgTableParams, $modal){
    $rootScope.cid= $routeParams.id;
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
    getOrders();
    
    //Open modal to show bigger picture
    $scope.showBigger = function(folder, imagem){
        var param = {'folder':folder, 'imagem': imagem}
        var modalInstance = $modal.open({
            templateUrl:'modalShowBigger.html',
            controller: 'modalInstanceShowBigger',
            size : 'lg',
            resolve:{ items: function(){
                    return param;
                }
            }
        }); 
    }
    
    //PHP para imprimir folhas de detalhe para pedido - para ser preenchido manualmente
    $scope.docForClient = function(pedido){

            $http({
                url:'php/docForClient.php',
                method:'POST',
                data:pedido.id
            }).then(function(answer){
                window.open(answer.data);
             //   alert(answer.data);
            });
    };
    
    //Print Doc to productio
    $scope.docToProd = function(pid){
        $http({
          url:'php/folhaConfecao.php',
          method:'POST',
          data:pid
      }).then(function(answer){
          window.open(answer.data);
      }); 
        $http({
          url:'php/folhaCorte.php',
          method:'POST',
          data:pid
      }).then(function(answer){
          window.open(answer.data);
      });
        $http({
          url:'php/folhaBordados.php',
          method:'POST',
          data:pid
          }).then(function(answer){
          window.open(answer.data);      
      }); 
      //Atualizar o status para em produção
      $http({
          url:'php/updateStatus.php',
          method:'POST',
          data:JSON.stringify({'pid':pid,'status':5})
      }).then(function(answer){
            getOrders();
      });
    };
    
    //Botão para Eliminar um tema
    $scope.deletePedido = function(pid){
        if(confirm("Atenção!! Vai eliminar este pedidido! Pretende Continuar?")){
            $http({
                url:'php/deletePedido.php',
                method:'POST',
                data:pid
            }).then(function(answer){
                //alert(answer.data);
                getOrders();
            });
        }
    };
    
    //Botão para alterar para edição - mudar status para 2
    $scope.changeToEdit = function(pid){
        $http({
            url:'php/updateStatus.php',
            method:'POST',
            data:JSON.stringify({'pid':pid,'status':2})
        }).then(function(answer){
            getOrders();
        })
    };

    //Botão para alterar para edição do pedido - mudar status para 1
    $scope.changeToEditPedido = function(pid){
        $http({
            url:'php/updateStatus.php',
            method:'POST',
            data:JSON.stringify({'pid':pid,'status':1})
        }).then(function(answer){
            getOrders();
        })
    };    
    
        //Botão para voltar atrás na produção
    $scope.voltarAtras = function(pid){
        $http({
            url:'php/updateStatus.php',
            method:'POST',
            data:JSON.stringify({'pid':pid,'status':3})
        }).then(function(answer){
            getOrders();
        })
    };    
    
        //Botão para finalizar a produção
    $scope.finalizarProd = function(pid){
        $http({
            url:'php/updateStatus.php',
            method:'POST',
            data:JSON.stringify({'pid':pid,'status':6})
        }).then(function(answer){
            getOrders();
        })
    };    
    
        //Botão para voltar atrás na produção
    $scope.voltarAtras5 = function(pid){
        $http({
            url:'php/updateStatus.php',
            method:'POST',
            data:JSON.stringify({'pid':pid,'status':5})
        }).then(function(answer){
            getOrders();
        })
    };      
    
    //Funções de ordenação da tabela
    $scope.sort = function (predicate) {
        $scope.predicate = predicate;
    };
    $scope.isSorted = function (predicate) {
        return ($scope.predicate == predicate);
    };    
    
    
    //Functions
    function getOrders(){
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
    }
});


/**
 * Modal para ver imagem maior
 */
angular.module('appCalika').controller('modalInstanceShowBigger', function($scope,$modalInstance,items){
        $scope.folder = items.folder;
        $scope.imagem = items.imagem;

    $scope.closeModal = function(){
        $modalInstance.dismiss('Cancel');
    };
});