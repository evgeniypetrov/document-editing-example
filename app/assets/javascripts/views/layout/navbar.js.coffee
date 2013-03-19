App.Views.Layout or= {}

# top header element - menu, user info, other actions
class App.Views.Layout.NavbarView extends Backbone.View
  template: JST['templates/layout/navbar']

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
