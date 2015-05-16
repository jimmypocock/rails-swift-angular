'use strict';

angular.module([
  'ui.router'
])

.config(
  ['$stateProvider', '$urlRouterProvider',
    function ($stateProvider, $urlRouterProvider) {
      $stateProvider
        .state('usersNew', {
          url: '/new',
          templateUrl: 'users/new/users.new.html',
          controller: 'UsersNewCtrl'
        });
    }
  ]
);