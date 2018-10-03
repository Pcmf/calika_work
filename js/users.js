angular.module('appCalika').controller('usersController',function($scope,$http){
    $scope.edit = false;
    
    //load
    loadUsers();
    //Botão editar
    $scope.editar = function(user){
        $scope.i = user;
        $scope.edit = true;
    };
    
    
          
     //Guardar novo ou alterações     
    $scope.saveUser = function(user){
        if(user){
                $http({
                    url:'php/saveUser.php',
                    method:'POST',
                    data:JSON.stringify(user)
                }).then(function(answer){
                    if(answer.data == 'Ok'){
                      loadUsers();
                      $scope.edit = false;
                    } else{
                        alert('Erro');
                    }
                });
        }
    };
    
    //Cancelar
    $scope.cancel = function(){
       $scope.edit = false;  
    };
    
    //Remover user
    $scope.removeUser = function(user){
       $http({
           url:'php/removeUser.php',
           method:'POST',
           data:JSON.stringify(user)
       }).then(function(resp){
           if(resp.data == 'Ok'){
              $scope.edit = false;
                loadUsers();
           } else{
               alert("Não é possivél remover este Utilizador.");
           }
       }); 
    };
    
    
    //Botão para gurdar os dados do email de servico
    $scope.saveEmailServico = function(e){
        $http({
            url:'php/saveEmailServico.php',
            method:'POST',
            data:JSON.stringify(e)
        }).then(function(answer){
            alert(answer.data);
        })
    }
    
    
    //Carrega os dados dos users e do email de servico
    function loadUsers(){
        $http({
            url:'php/getData.php',
            method:'POST',
            data:{params:'users'}
        }).then(function(answer){
           $scope.users = answer.data;
           $scope.i={};
        
        
            $http({
                url:'php/getData.php',
                method:'POST',
                data:{params:'emailservico'}
            }).then(function(answer){
                    $scope.e = answer.data[0];
            });
        });
    };

});



