app.views.content or= {}

# top header element - menu, user info, other actions
class app.views.content.GridView extends Backbone.View
  template: JST['templates/content/grid']
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
