/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the emplate in the editor.
 */
angular.module('appCalika').controller('clientController',function($scope,$http){
    $scope.edit = false;
    loadClients();
//    $scope.files =[];
    $scope.imgBlob = null;
    $scope.filename ='';
    $scope.i={};
    $scope.i.valorinicial = 1;
    
    
    $scope.editar = function(clt){
        if(clt == undefined){
            $scope.i.valorinicial = 1;
        }
        $scope.i = clt;

        $scope.edit = true;
    };
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
            width: 200, // maximum width
            height: 200 // maximum height
        }, function(blob, didItResize) {
            $scope.imgBlob = blob;
            $scope.i.logo = $scope.filename;
        });        
        
      });
    };
            

    $scope.saveClient = function(clt){
        $scope.i.folder = 'logos';
        if($scope.filename != ''){
            $scope.i.logo = $scope.filename;    
            var request = new XMLHttpRequest();
            request.open("POST", "php/upload-image.php", true);
            var data = new FormData();
            data.append("image",$scope.imgBlob,$scope.filename);
            request.send(data); 
        }

        $http({
            url:'php/saveClient.php',
            method:'POST',
            data:{params:JSON.stringify(clt)}
        }).then(function(answer){
            if(answer.data == 'Ok'){
              loadClients();
              $scope.edit = false;
            } else{
                alert('Erro');
            }
        });
    };
    
    
    $scope.cancel = function(){
       $scope.edit = false;  
    };
    $scope.removeClient = function(clt){
       $http({
           url:'php/removeClient.php',
           method:'POST',
           data:{params:JSON.stringify(clt)}
       }).then(function(resp){
           if(resp.data == 'Ok'){
              $scope.edit = false;
                loadClients();
           } else{
               alert("Não é possivél remover este cliente.");
           }
       }); 
    };
    
    function loadClients(){
        $http({
            url:'php/getData.php',
            method:'POST',
            data:{params:'cliente'}
        }).then(function(answer){
           $scope.clients = answer.data;
           $scope.i={};
           $scope.filename = '';
           document.getElementById('fileToUpload').value = null;
        });
    };

});

