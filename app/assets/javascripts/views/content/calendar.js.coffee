app.views.content or= {}

# top header element - menu, user info, other actions
class app.views.content.CalendarView extends Backbone.View
  template: JST['templates/content/calendar']
  className: 'calendar'

  events:
    "click ul.menu li a" : "menuItemSelected"

  initialize: () ->
    # init

  render: () ->
    @$el.html(@template())
    @

  # events handlers
  menuItemSelected: (e) ->
    e.preventDefault()
    console.log('menuItemSelected')
