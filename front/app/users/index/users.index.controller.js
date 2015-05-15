'use strict';

angular.module('jsonTestFrontApp')
  .controller('UsersIndexCtrl', ['$scope', 'Users',
    function ($scope, Users) {
      $scope.users;

      Users.get('/users')
      .then(function(resolve){
        $scope.users = resolve["users"];
      })
      .catch(function(err){
        // return cb(err);
      });
    }
  ]);
