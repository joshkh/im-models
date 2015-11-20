'use strict'

imjs = require 'imjs'
_ = require 'underscore'
Q = require 'q'

### @ngInject ###
module.exports = ($scope) ->
  $scope.welcome = "Congratulations! Just kidding."

  mines = [
    {name: "flymine", url: "http://www.flymine.org/query"}
    {name: "mousemine", url: "http://www.mousemine.org/mousemine"}
  ]

  $scope.mines = mines

  $scope.exists = (name, arr)->
    if name in arr then return name else null


  ps = (new imjs.Service(root: mine.url).fetchModel() for mine in mines)

  # Fetch models for each mine
  Q.all(ps).then (immodels) ->

    classes = {}

    for immodel in immodels

      # Get the mine name based on the URL
      index = immodel.service.root.indexOf("/service/")
      root = immodel.service.root.substring 0, index
      {name} = _.findWhere mines, {url: root}

      # console.log "name", name

      for imclass, values of immodel.classes
        # console.log values
        classes[imclass] ?= {}

        for attribute, value of values.attributes

          classes[imclass][attribute] ?= []
          classes[imclass][attribute].push name

    $scope.$apply -> $scope.classes = classes
