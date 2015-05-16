'use strict';

angular.module('jsonTestFrontApp')
  .controller('UsersNewCtrl', ['$scope', '$state', 'API',
    function ($scope, $state, API) {
      $scope.brandNew = {
        user: {}
      };

      $scope.createUser = function(){
        API.post('/users', $scope.brandNew)
        .then(function(resolve){
          $state.go('usersIndex');
        })
        .catch(function(err){
          // return cb(err);
        });
      }
    }
  ]);
