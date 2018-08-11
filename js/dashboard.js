/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

angular.module('appCalika').controller('dashboardController',function($scope,$http){
    
    $http({
        url:'php/dashboard.php',
        method:'GET',
    }).then(function(answer){
        $scope.data = answer.data;
    });
    
});
