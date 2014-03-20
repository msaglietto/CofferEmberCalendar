CalendarController = require('controllers/Calendar')

test('Calendar Controller, should calculate the first day of the calendar month given a model', ->
  calController = new CalendarController()
  model = {year: 2014, month: 3, day: 15}
  date = calController.getDateLimit(model, true).toDateString()
  equal(date, 'Sun Feb 23 2014', 'First date for March should be 23 of February but is ' + date)

  model = {year: 2014, month: 6, day: 15}
  date = calController.getDateLimit(model, true).toDateString()
  equal(date, 'Sun Jun 01 2014', 'First date for June should be 01 of June but is ' + date)
)

test('Calendar Controller, should calculate the last day of the calendar month given a model', ->
  calController = new CalendarController()
  model = {year: 2014, month: 3, day: 15}
  date = calController.getDateLimit(model, false).toDateString()
  equal(date, 'Sat Apr 05 2014', 'Last date for March should be 05 of April but is ' + date )

  model = {year: 2014, month: 5, day: 15}
  date = calController.getDateLimit(model, false).toDateString()
  equal(date, 'Sat May 31 2014', 'Last date for May should be 31 of May but is ' + date )
)
