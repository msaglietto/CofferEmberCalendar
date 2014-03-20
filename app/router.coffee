App = require 'app'


App.Router.map(() ->
  @.resource('calendar', { path: '/year/:year/month/:month/day/:day' })
)