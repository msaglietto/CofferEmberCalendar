App = require 'app'


###*
  Route IndexRoute

  @class IndexRoute
  @namespace App
  @extends Ember.Route
###
module.exports = App.IndexRoute = Ember.Route.extend
  ###*
    Index route will just redirect to calendar

    @inheritDoc
  ###
  beforeModel : () ->
    date = new Date()
    @.transitionTo('calendar', {year: date.getFullYear(), month: date.getMonth() + 1, day: date.getDate()})