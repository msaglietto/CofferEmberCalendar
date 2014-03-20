###*
  Handlebars helper formatDate

  @method formatDate
  @for Ember.Handlebars.helpers
  @param {Object} [context]*
  @return {String} HTML string
###
module.exports = Ember.Handlebars.registerBoundHelper 'formatDate', (value = new Date(), options) ->
  date = if Object::toString.call(value) is Object::toString.call(new Date) then value else new Date(value.year, value.month - 1, value.day)
  formated = options.hash.format
  month = "January_February_March_April_May_June_July_August_September_October_November_December".split("_")
  
  formated = formated.replace(/MMMM/g, month[date.getMonth()])
  formated = formated.replace(/YYYY/g, date.getFullYear())
  formated = formated.replace(/d/g, date.getDate())
