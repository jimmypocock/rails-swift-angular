'use strict';

angular
  .module('jsonTestFrontApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngTouch',
    'ui.router'
  ])
  .run(
    ['$rootScope', '$state', '$stateParams',
      function ($rootScope, $state, $stateParams) {
        $rootScope.$state = $state;
        $rootScope.$stateParams = $stateParams;
      }
    ]
  )
  .config(function ($urlRouterProvider, $httpProvider) {
    $urlRouterProvider
      .otherwise('/');

    $httpProvider.defaults.headers.common = {
      "Accept":"application/json",
      "Content-Type":"application/json"
    }
  });
