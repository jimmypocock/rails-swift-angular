'use strict';

angular.module([
  'ui.router'
])

.config(
  ['$stateProvider', '$urlRouterProvider',
    function ($stateProvider, $urlRouterProvider) {
      $stateProvider
        .state('usersShow', {
          url: '/:id',
          templateUrl: 'users/show/users.show.html',
          controller: 'UsersShowCtrl'
        });
    }
  ]
);