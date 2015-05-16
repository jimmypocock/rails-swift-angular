'use strict';

angular.module('jsonTestFrontApp')
  .controller('UsersEditCtrl', ['$scope', '$stateParams', '$state', 'API',
    function ($scope, $stateParams, $state, API) {
      $scope.user;
      $scope.messages = {
        success: "Yay! You did it.",
        error: "Not cool, dude!"
      };
      $scope.success = null;

      $scope.getUser = (function(){
        API.get('/users/' + $stateParams.id)
        .then(function(resolve){
          $scope.user = resolve["user"];
        })
        .catch(function(err){
          // return cb(err);
        });
      })();

      $scope.updateUser = function(){
        API.put('/users/' + $stateParams.id, {
          "user": $scope.user
        })
        .then(function(resolve){
          $scope.user = resolve["user"];
          $scope.success = true;
        })
        .catch(function(err){
          $scope.success = false;
        });
      }

      $scope.deleteUser = function(){
        API.delete('/users/' + $stateParams.id)
        .then(function(resolve){
          $state.go('usersIndex');
        })
        .catch(function(err){
          $scope.success = false;
        });
      }
    }
  ]);
