'use strict';

angular.module([
  'ui.router'
])

.config(
  ['$stateProvider', '$urlRouterProvider',
    function ($stateProvider, $urlRouterProvider) {
      $stateProvider
        .state('usersEdit', {
          url: '/:id',
          templateUrl: 'users/edit/users.edit.html',
          controller: 'UsersEditCtrl'
        });
    }
  ]
);