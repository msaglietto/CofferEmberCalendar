App = require 'app'

###*
  Controller CalendarController

  @class CalendarController
  @namespace App
  @extends Ember.Controller
###
module.exports = App.CalendarController = Ember.Controller.extend
  ###*
    If first is true  it will return the first sunday for a month, meaning if the month
    start on a monday it will go to the last month and return the sunday
    If first is not set it will return the last saturday of a month, meaning if the month
    finish on a Wenesday it will go to the next month to find the saturaday
    @method getDateLimit
    @param {Object} model Object to get the month and year from
    @param {Boolean} first If return the first day of the month or the last one
  ###
  getDateLimit: (model, first) ->
    #For first limit check the current month adjusting the month to 0 index
    #For last limit  check the next month 
    month = if first then model.month - 1 else model.month
    auxDate = new Date(model.year, month, 1)
    day = auxDate.getDay()
    #For first day will just reset to day 0
    #For last go to saturday or if next start on sunday just go one back
    offset = if first then 0 else if day is 0 then -1 else 6
    diff = auxDate.getDate() - day + offset
    new Date(auxDate.setDate(diff))
  ###*
    Return an array of dates between two dates
    @method buildMonthRange
    @param {Date} from
    @param {Date} to
  ###
  buildMonthRange: (from, to) ->
    range = []
    while from <= to
      range.push(new Date(from))
      from.setDate(from.getDate() + 1)
  days: (() ->
    model = @.get('model')
    return @.buildMonthRange(@.getDateLimit(model, true), @.getDateLimit(model, false))).property('model')
  lastYear: (() ->
    return offsetModel(@.get('model'), {year: -1})
  ).property('model')
  lastMonth: (() ->
    return offsetModel(@.get('model'), {month: -1})
  ).property('model')
  nextMonth: (() ->
    return offsetModel(@.get('model'), {month: 1})
  ).property('model')
  nextYear: (() ->
    return offsetModel(@.get('model'), {year: 1})
  ).property('model')
  today: (() ->
    today = new Date()
    return {year: today.getFullYear(), month: today.getMonth() + 1, day: today.getDate()}
  ).property('model')


offsetModel = (model, offsets) ->
  date = new Date(model.year, model.month - 1, model.day)
  date.setFullYear(date.getFullYear() + (offsets.year || 0), date.getMonth() + (offsets.month || 0))
  $.extend({}, model, {year : date.getFullYear(), month: date.getMonth() + 1})