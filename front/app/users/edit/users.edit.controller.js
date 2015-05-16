'use strict';

angular.module('jsonTestFrontApp')
  .controller('UsersEditCtrl', ['$scope', '$stateParams', 'API',
    function ($scope, $stateParams, API) {
      $scope.user;

      API.get('/users/' + $stateParams.id)
      .then(function(resolve){
        $scope.user = resolve["user"];
      })
      .catch(function(err){
        // return cb(err);
      });
    }
  ]);
