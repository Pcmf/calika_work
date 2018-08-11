/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

angular.module('appCalika').controller('configController',function($scope, $http){
    $scope.i ={};
    closeAllEdit();

    loadData();
    //    Editar Artigos
    $scope.editarArt = function(d){
            $scope.i.iArt = d.id;
            $scope.i.nArt = d.nome;
            $scope.i.dArt = d.descricao;
        $scope.editArt = true;
    };
    $scope.closeArt = function(){
        $scope.editArt = false;       
    };
    $scope.saveArt = function(i){
        var parm = {};
        parm.fx = 'artigo';
        parm.ob = i;
        saveFunc(parm);        
    };
    $scope.deleteArt = function(i){
        var parm = {};
        parm.fx = 'artigo';
        parm.ob = i;
        deleteFunc(parm);         
    };

//    Editar Cores
    $scope.editarCor = function(d){
            $scope.i.iCor = d.id;
            $scope.i.nCor = d.nome;
            $scope.i.rCor = d.ref;
        $scope.editCor = true;
    };
    $scope.closeCor = function(){
        $scope.editCor = false;       
    };
    $scope.saveCor = function(i){
        //Testar valores
        var parm = {};
        parm.fx = 'cor';
        parm.ob = i;
        saveFunc(parm);      
    };
    $scope.deleteCor = function(i){
        var parm = {};
        parm.fx = 'cor';
        parm.ob = i;
        deleteFunc(parm);         
    };
    
    //    Editar Elementos
    $scope.editarElem = function(d){
            $scope.i.id = d.id;
            $scope.i.nome = d.nome;
            $scope.i.descricao = d.descricao;
        $scope.editElem = true;
    };
    $scope.closeElem = function(){
        $scope.editElem = false;       
    };
    $scope.saveElem = function(i){
        //Testar valores
        var parm = {};
        parm.fx = 'elemento';
        parm.ob = i;
        saveFunc(parm);        
    };
    $scope.deleteElem = function(i){
        var parm = {};
        parm.fx = 'elemento';
        parm.ob = i;
        deleteFunc(parm);         
    };
    
    
    //    Editar Embalagens
    $scope.editarEmb = function(d){
            $scope.i.iEmb = d.id;
            $scope.i.nEmb = d.nome;
            $scope.i.dEmb = d.descricao;
        $scope.editEmb = true;
    };
    $scope.closeEmb = function(){
        $scope.editEmb = false;       
    };
    $scope.saveEmb = function(i){
        //Testar valores
        var parm = {};
        parm.fx = 'embalagem';
        parm.ob = i;
        saveFunc(parm);
    };
    
    $scope.deleteEmb = function(i){
        var parm = {};
        parm.fx = 'embalagem';
        parm.ob = i;
        deleteFunc(parm);         
    };

        //    Editar Estado
//    $scope.editarEst = function(d){
//            $scope.i.nEst = d.nome;
//        $scope.editEst = true;
//    };
//    $scope.closeEst = function(){
//        $scope.editEst = false;       
//    };
//    $scope.saveEst = function(i){
//        //Testar valores
//        var parm = {};
//        parm.fx = 'situacao';
//        parm.ob = i;
//        saveFunc(parm);        
//    }; 
        //    Editar Linhas
    $scope.editarLin = function(d){
            $scope.i.iLin = d.id;
            $scope.i.cLin = d.cor;
            $scope.i.rLin = d.ref;
        $scope.editLin = true;
    };
    $scope.closeLin = function(){
        $scope.editLin = false;       
    };
    $scope.saveLin = function(i){
        //Testar valores
        var parm = {};
        parm.fx = 'linha';
        parm.ob = i;
        saveFunc(parm);        
    }; 
    $scope.deleteLin = function(i){
        var parm = {};
        parm.fx = 'linha';
        parm.ob = i;
        deleteFunc(parm);         
    };
    //Editar Tamanhos
    
    
    
    //Função para obter os dados
    function loadData(){
        //Get data from file
        $http({
            url:'php/getConfigs.php',
            method:'POST',
        }).then(function(ans){
            $scope.data  =ans.data;
        });
    }
    
    //Função para Guardar alterações
    function saveFunc(parm){
        $http({
            url:'php/saveConfigs.php',
            method:'POST',
            data:{params:JSON.stringify(parm)}
        }).then(function(answer){
                if(answer.data != 'Ok'){
                    alert(answer.data);
                } else {
                    closeAllEdit();
                    loadData();
                }
        });
    }
    
    //Função para eliminar elementos
    function deleteFunc(parm){
        $http({
            url:'php/deleteConfigs.php',
            method:'POST',
            data:{params:JSON.stringify(parm)}
        }).then(function(answer){
                if(answer.data != 'Ok'){
                    alert(answer.data);
                } else {
                    closeAllEdit();
                    loadData();
                }
        });
    }    
    
        
    //Função para fechar todos o paineis de edição
    function closeAllEdit(){
        $scope.editCor = false;
        $scope.editEmb = false;
        $scope.editArt = false;
        $scope.editLin = false;
        $scope.editElem = false;
    }
});


