App = require 'app'

###*
  Route CalendarRoute

  @class CalendarRoute
  @namespace App
  @extends Ember.Route
###
module.exports = App.CalendarRoute = Ember.Route.extend
  ###*
    Override this if needed, else remove it

    @inheritDoc
  ###
  setupController: (controller, model) ->
    controller.set('model', model)

  renderTemplate: () ->
    @.render('calendar')

  actions: {
    goTo: (model) -> 
      @.transitionTo('calendar', model)
  }