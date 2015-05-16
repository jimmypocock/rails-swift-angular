'use strict';

angular.module('jsonTestFrontApp')
  .controller('UsersNewCtrl', ['$scope', '$state', 'API',
    function ($scope, $state, API) {
      $scope.user = {};

      $scope.createUser = function(){
        API.post('/users', {
          "user": $scope.user
        })
        .then(function(resolve){
          $state.go('usersIndex');
        })
        .catch(function(err){
          // return cb(err);
        });
      }
    }
  ]);
