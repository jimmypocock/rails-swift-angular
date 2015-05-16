'use strict';

angular.module('jsonTestFrontApp')
  .controller('UsersIndexCtrl', ['$scope', 'API',
    function ($scope, API) {
      $scope.users;

      API.get('/users')
      .then(function(resolve){
        $scope.users = resolve["users"];
      })
      .catch(function(err){
        // return cb(err);
      });
    }
  ]);
