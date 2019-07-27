/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
angular.module('appCalika').controller('temaController',function($scope,$http,$routeParams,$modal){
    $scope.cid = $routeParams.cid;
    $scope.modelos = {};
    var anoAtual = (new Date()).getFullYear();
    $scope.years= [anoAtual,anoAtual+1];
    $scope.imgBlob = null;
    $scope.filename ='';
    $scope.i={};
    //Obter dados do cliente
    $http({
        url:'php/getDataFxId.php',
        method:'POST',
        data:{params: JSON.stringify({'fx':'cliente','id':$scope.cid})}
    }).then(function(answer){
        $scope.clt = answer.data;
    });
    $scope.editar = !(!$routeParams.pid);
    //Se o pedido já estiver criado
    if($routeParams.pid){
        //Obter dados do pedido
        $http({
            url:'php/getDataFxId.php',
            method:'POST',
            data:{params: JSON.stringify({'fx':'pedido','id':$routeParams.pid})}
        }).then(function(answer){ 
            $scope.pedido = answer.data;
            getModelosByPedido();
        });
    }
    $scope.setFiles = function(element) {
        $scope.$apply(function($scope) {
      // Turn the FileList object into an Array
        var files = []
        for (var i = 0; i < element.files.length; i++) {
          files.push(element.files[i])
        }
//        alert(files[0]['name']);
        $scope.filename = files[0]['name'];
//        alert(filename);
        ImageTools.resize(files[0], {
            width: 1000, // maximum width
            height: 1000 // maximum height
        }, function(blob, didItResize) {
            $scope.imgBlob = blob;
            $scope.i.imagem = $scope.filename;
        });        
        
      });
    };
            
    //Botão para cria o Tema/Pedido e fazer o upload da imagem
    $scope.criarTema = function(){
        $scope.i.folder = 'temas';
        if($scope.filename != ''){
            $scope.i.imagem = $scope.filename;    
            var request = new XMLHttpRequest();
            request.open("POST", "php/upload-image-tema.php", true);
            var data = new FormData();
            data.append("image",$scope.imgBlob,$scope.filename);
            request.send(data); 
        }
        $http({
            url:'php/criarTema.php',
            method:'POST',
            data:JSON.stringify({'clt':$scope.clt,'imagem':$scope.filename,'tema':$scope.t})
        }).then(function(answer){
            $scope.pedido = answer.data;
            $scope.editar = true;
        });
    };
    
    
    //Botão para Adicionar um modelo
    $scope.addModelo = function(){
        var modalInstance = $modal.open({
            templateUrl: 'modalAddModel2.html',
            controller: 'modalInstanceAddModel2',
            size: 'lg',
            resolve: {items: function () {
                    var parm = {};
                    parm.clt = $scope.clt;
                    parm.tema = $scope.pedido;
                    return parm;
                }
            }
        });
        //Modal return - list models
        modalInstance.result.then(function(){
            getModelosByPedido();
        }, function(){
            getModelosByPedido();
        });          
    };
    
    //Button to remove Modelo from table list
    $scope.delModelo = function(modelo){
        if(confirm("Vai anular este modelo! Pretende continuar?")){
            $http({
                url:'php/deleteModelo.php',
                method:'POST',
                data:modelo
            }).then(function(answer){
                getModelosByPedido();
            })
        }
    }

    //Button to edit Modelo from table list
    $scope.editModelo = function(modelo){

            var parm = {};
            parm.modelo = modelo;
            parm.tema = $scope.pedido;
            parm.clt = $scope.clt;

            var modalInstance = $modal.open({
                templateUrl: 'modalEditModel.html',
                controller: 'modalInstanceEditModel',
                size: 'lg',
                resolve: {items: function () {
                        return parm;
                    }
                }            
            });
            modalInstance.result.then(function(){
                getModelosByPedido();
            },function(){
                getModelosByPedido();
            });

    };
//To Approval
    $scope.closeToAprovacao = function(){
        var modalInstance = $modal.open({
            templateUrl:'modalToApproval.html',
            controller:'modalInstanceToApproval',
            size:'sm',
            resolve: {items: function(){
                    return $scope.pedido.id;
                }
            }
        });
            modalInstance.result.then(function(){
                window.location.replace("#!/list/"+$scope.cid);
            },function(){
                getModelosByPedido();
            });        
    }
    
    //Funtions
    function getModelosByPedido(){
            $http({
                url:'php/getModelosByPedido.php',
                method:'POST',
                data:$scope.pedido.id
            }).then(function(answer){
                //create scala array
                $scope.modelos = answer.data;
                $scope.editar=true;
            });
    }
});



/**
 * MODAL instance for ADD NEW Modelo
 */
angular.module('appCalika').controller('modalInstanceAddModel2', function ($scope,$http, $modalInstance,items) {
        $scope.showPrincipal = false;
        $scope.loadDetalhes = false;
        $scope.tema = items.tema;
        $scope.clt = items.clt;
        $scope.i = {};
        $scope.i.imagens = [];
        //get the referencia do modelo from detalhepedido
        $http({
            url:'php/getReferenciaModelo.php',
            method:'POST',
            data:JSON.stringify({'pedido':items.tema,'clt':$scope.clt})
        }).then(function(answer){
            $scope.i.refinterna = items.clt.codigo+answer.data;
        });

        //Load artigos
        $http({
            url:'php/getData.php',
            method:'POST',
            data:{params:'artigo'}
        }).then(function(answer){
            $scope.artigos = answer.data;
        });
        //Load Escalas
       $http({
            url:'php/getData.php',
            method:'POST',
            data:{params:'escala'}
        }).then(function(answer){
            $scope.escalas = answer.data;
        });
        //Test if all fields are filledup
        $scope.testFields = function(){
            if($scope.i.a && $scope.i.descricao && $scope.i.escala){
                $scope.showPrincipal = true;
            } else {
                $scope.showPrincipal = false;
            }
        }

        //Select imagem PRINCIPAL
        $scope.setFiles = function(element) {
                $scope.$apply(function($scope) {
              // Turn the FileList object into an Array
                var files = []
                for (var i = 0; i < element.files.length; i++) {
                  files.push(element.files[i])
                }
                $scope.filename = files[0]['name'];
                
                ImageTools.resize(files[0], {
                    width: 800, // maximum width
                    height: 600 // maximum height
                }, function(blob, didItResize) {
                    $scope.imgBlob = blob;
                    $scope.i.mainimg = $scope.filename;
            //Save Modelo and set it ready to insert the details pictures
                var parm = {};
                parm.cltId = items.clt.id;
                parm.temaId = items.tema.id;
                parm.pid = items.tema.pid;
                parm.ano = items.tema.ano;
                parm.refInt = $scope.i.refinterna;
                parm.modelo = $scope.i;

                $scope.i.folder = 'modelos';
                if($scope.filename != ''){
                    $scope.i.mainimg = $scope.filename;    
                    var request = new XMLHttpRequest();
                    request.open("POST", "php/upload-image-modelo.php", true);
                    var data = new FormData();
                    data.append("image",$scope.imgBlob,$scope.filename);
                    request.send(data);
                }
                //Save to modelo table
                $http({
                    url:'php/saveModelo.php',
                    method:'POST',
                    data:JSON.stringify(parm)
                }).then(function(answer){
                    //atualiza o scope para mostra a imagem principal
                    $scope.i.id = answer.data;
                    // mostra o botão para adicionar imagens de detalhe
                    $scope.loadDetalhes = true;
                });
              });
            });
        };

        //SELECT DETAILS IMAGES
        $scope.setFilesDet = function(element){
            $scope.$apply(function($scope) {
                // Turn the FileList object into an Array
                var files = []
                for (var i = 0; i < element.files.length; i++) {
                  files.push(element.files[i])
                }
                $scope.filename = files[0]['name'];
                
                ImageTools.resize(files[0], {
                    width: 200, // maximum width
                    height: 200 // maximum height
                }, function(blob, didItResize) {
                    $scope.imgBlob = blob;

                    $scope.i.folder = 'modelos';
                    if($scope.filename != ''){
                        var request = new XMLHttpRequest();
                        request.open("POST", "php/upload-image-modelo.php", true);
                        var data = new FormData();
                        data.append("image",$scope.imgBlob,$scope.filename);
                        request.send(data);
                        $scope.$apply(function() {$scope.i.imagens.push($scope.filename);});
                    }
                });
            });
        }; //end select details images



        //Button to Save model- TODO
        $scope.saveModelo = function(modelo){
            //Save to modelo table
            $http({
                url:'php/updateModelo.php',
                method:'POST',
                data:JSON.stringify(modelo)
            }).then(function(answer){
                    $scope.closeModal();
            });
            
        };
        
        
        //Close the modal
        $scope.closeModal = function () {
            $modalInstance.dismiss('cancel');
        };
});

/**
 * MODAL instance for EDIT NEW Modelo
 */
angular.module('appCalika').controller('modalInstanceEditModel', function ($scope,$http, $modalInstance,items) {
        $scope.i = {};
        $scope.i.imagens = {};
        $scope.i = items.modelo;
        if(items.modelo.imagens){
            $scope.i.imagens = JSON.parse(items.modelo.imagens);           
        }

        $scope.escSel = items.modelo.escala;
        $scope.tema = items.tema;
        $scope.clt = items.clt;

        // Get article name by id
       $http({
            url:'php/getDataFxId.php',
            method:'POST',
            data:{params:JSON.stringify({'fx':'artigo','id':items.modelo.artigo})}
        }).then(function(answer){
            $scope.i.artigo = answer.data;
        });
        
        //Load Escalas
       $http({
            url:'php/getData.php',
            method:'POST',
            data:{params:'escala'}
        }).then(function(answer){
            $scope.escalas = answer.data;
        });
        // Get escala by id
       $http({
            url:'php/getDataFxId.php',
            method:'POST',
            data:{params:JSON.stringify({'fx':'escala','id':items.modelo.escala})}
        }).then(function(answer){
            $scope.i.escala = answer.data;
        });
        //Select imagem PRINCIPAL
        $scope.setFiles = function(element) {
                $scope.$apply(function($scope) {
              // Turn the FileList object into an Array
                var files = []
                for (var i = 0; i < element.files.length; i++) {
                  files.push(element.files[i])
                }
                $scope.filename = files[0]['name'];
                
                ImageTools.resize(files[0], {
                    width: 800, // maximum width
                    height: 600 // maximum height
                }, function(blob, didItResize) {
                    $scope.imgBlob = blob;
                    $scope.i.mainimg = $scope.filename;
            //Save Modelo and set it ready to insert the details pictures
                var parm = {};
                parm.cltId = items.clt.id;
                parm.temaId = items.tema.id;
                parm.pid = items.tema.pid;
                parm.ano = items.tema.ano;
                parm.refInt = $scope.i.refinterna;
                parm.modelo = $scope.i;

                $scope.i.folder = 'modelos';
                if($scope.filename != ''){
                    $scope.i.mainimg = $scope.filename;    
                    var request = new XMLHttpRequest();
                    request.open("POST", "php/upload-image-modelo.php", true);
                    var data = new FormData();
                    data.append("image",$scope.imgBlob,$scope.filename);
                    request.send(data);
                                            
                  $scope.$digest();                         
                }
              });
            });
        };
       //SELECT DETAILS IMAGES
        $scope.setFilesDetEdit = function(element){
            $scope.$apply(function($scope) {
                // Turn the FileList object into an Array
                var files = []
                for (var i = 0; i < element.files.length; i++) {
                  files.push(element.files[i]);
                }
                $scope.filename = files[0]['name'];
                
                ImageTools.resize(files[0], {
                    width: 200, // maximum width
                    height: 200 // maximum height
                }, function(blob, didItResize) {
                    $scope.imgBlob = blob;
                    $scope.i.folder = 'modelos';
                    if($scope.i.imagens ==''){$scope.i.imagens = [];};
                    if($scope.filename != ''){
                        var request = new XMLHttpRequest();
                        request.open("POST", "php/upload-image-modelo.php", true);
                        var data = new FormData();
                        data.append("image",$scope.imgBlob,$scope.filename);
                        request.send(data);
                        $scope.$apply(function() {($scope.i.imagens).push($scope.filename);}, 1000);                        
                    }
                });
            });
        }; //end select details images

        //Remove one image from detail
        $scope.deleteImg = function(img, mid){
            var conf = confirm('Atenção! Vai eliminar esta imagem. Pretende continuar?');
            if(conf){
                $http({
                    url: 'php/deleteImgDetail.php',
                    method:'POST',
                    data:JSON.stringify({'mid':mid,'img':img})
                });
                var idx = $scope.i.imagens.indexOf(img);
                $scope.i.imagens.splice(idx,1);
            }
        };

        //Button to Save model
        $scope.saveModelo = function(modelo){
            //Save to modelo table
            $http({
                url:'php/updateModelo.php',
                method:'POST',
                data:JSON.stringify(modelo)
            }).then(function(answer){
                $modalInstance.close();
            });
        };
      
        
        //Close the modal
        $scope.closeModal = function () {
            $modalInstance.dismiss('cancel');
        };    
});

/**
 * MODAL instance for ToApproval
 */
angular.module('appCalika').controller('modalInstanceToApproval', function ($scope,$http, $modalInstance,items) {
//    console.log(items);
    $scope.criarFolhasCliente = function(){
        $http({
            url:'php/docForClient.php',
            method:'POST',
            data:items
        }).then(function(answer){
            window.open(answer.data);
            $modalInstance.close();
        });
    }
    
    $scope.notNow = function(){
        $http({
            url:'php/updateStatus.php',
            method:"POST",
            data:JSON.stringify({'pid':items,'status':2})
        }).then(function(answer){
            $modalInstance.close();
        });
    }
});