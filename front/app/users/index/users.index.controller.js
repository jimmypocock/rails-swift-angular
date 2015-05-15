'use strict';

angular.module('jsonTestFrontApp')
  .controller('UsersIndexCtrl', function ($scope) {
    $scope.users = [
      {
        name: "1",
        id: 1
      },
      {
        name: "2",
        id: 2
      },
      {
        name: "3",
        id: 3
      }
    ];
  });
