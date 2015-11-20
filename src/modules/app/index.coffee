'use strict'

module.exports = angular.module('immodels', [
  'ui.bootstrap'
  'ui.router'
  require('../../../tmp/templates').name
  require('../common/index').name
  require('./foo/index').name
])
