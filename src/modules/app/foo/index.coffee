'use strict'

module.exports = angular.module('immodels.foo', [])
    .config(($stateProvider) ->
      $stateProvider.state 'foo',
      url: ''
      templateUrl: 'app/foo/layout.html'
      controller: 'fooController'
      return
).controller('fooController', require('./fooController'))
