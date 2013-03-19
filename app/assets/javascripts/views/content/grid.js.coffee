App.Views.Content or= {}

# top header element - menu, user info, other actions
class App.Views.Content.GridView extends Backbone.View
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
