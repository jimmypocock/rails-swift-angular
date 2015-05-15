'use strict';

angular.module('jsonTestFrontApp')
  .controller('UsersShowCtrl', ['$scope', '$stateParams',
    function ($scope, $stateParams) {
      $scope.id = $stateParams.id;
    }
  ]);
