'use strict';

angular.module('jsonTestFrontApp')
  .controller('UsersShowCtrl', ['$scope', '$stateParams', 'Users',
    function ($scope, $stateParams, Users) {
      $scope.user;

      Users.get('/users/' + $stateParams.id)
      .then(function(resolve){
        $scope.user = resolve["user"];
      })
      .catch(function(err){
        // return cb(err);
      });
    }
  ]);
