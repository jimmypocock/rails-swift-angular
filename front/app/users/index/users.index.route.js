'use strict';

angular.module([
  'ui.router'
])

.config(
  ['$stateProvider', '$urlRouterProvider',
    function ($stateProvider, $urlRouterProvider) {
      $stateProvider
        .state('usersIndex', {
          url: '/',
          templateUrl: 'users/index/users.index.html',
          controller: 'UsersIndexCtrl'
        });
    }
  ]
);