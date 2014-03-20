App = require 'app'

###*
  Component CalendarDayComponent

  @class CalendarDayComponent
  @namespace App
  @extends Ember.Component
###
module.exports = App.CalendarDayComponent = Ember.Component.extend
  tagName: 'div'
  classNames: ['cal-day']
  classNameBindings: ['isSelected', 'isDisable', 'isToday']
  isSelected: (()->
    date = new Date(@.date)
    if date.getDate() is parseInt(@.selected.day, 10) and date.getMonth() is @.selected.month - 1
      'selected'
  ).property('date', 'selected')
  isDisable: (() ->
    if new Date(@.date).getMonth() isnt @.selected.month - 1
      'disabled'
  ).property('date')
  isToday: (() ->
    today = new Date()
    today.setHours(0,0,0,0)
    if @.date is today.getTime()
      'today'
  ).property('date')
  model: (() -> 
    date = new Date(@.date)
    { year: date.getFullYear(), month: date.getMonth() + 1, day: date.getDate() }
  ).property('date')
  click: () ->
    @.sendAction('action', @.get('model'))


