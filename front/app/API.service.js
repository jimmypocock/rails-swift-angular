'use strict';

angular.module('jsonTestFrontApp')
  .factory('Users', ['$http', '$q',
    function ($http, $q) {

      var host = 'http://localhost:3000'

      return {

        get: function(path, callback){
          var cb = callback || angular.noop;
          var deferred = $q.defer();
          var url = host + path;
          var that = this;

          $http.get(url)
            .success(function(data){
              deferred.resolve(data);
              return cb();
            })
            .error(function(err) {
              deferred.reject(err);
              return cb(err);
            }.bind(this));

          return deferred.promise;

        },

        create: function(path, input, callback){
          var cb = callback || angular.noop;
          var deferred = $q.defer();
          var url = host + path;
          var that = this;

          $http.post(url, input)
          .success(function(data){
            deferred.resolve(data);
            return cb();
          })
          .error(function(err){
            deferred.reject(err);
            return cb(err);
          }.bind(this));

          return deferred.promise;

        },

        update: function(path, input, callback){
          var cb = callback || angular.noop;
          var deferred = $q.defer();
          var url = host + path;
          var that = this;

          $http.put(url, input)
          .success(function(data){
            deferred.resolve(data);
            return cb();
          })
          .error(function(err){
            deferred.reject(err);
            return cb(err);
          }.bind(this));

          return deferred.promise;

        },

        delete: function(path, callback){
          var cb = callback || angular.noop;
          var deferred = $q.defer();
          var url = host + path;
          var that = this;

          $http.delete(url)
          .success(function(data){
            deferred.resolve(data);
            return cb();
          })
          .error(function(err){
            deferred.reject(err);
            return cb(err);
          }.bind(this));

          return deferred.promise;
        }
      }

    }
  ]);