app.views.layout or= {}

# top header element - menu, user info, other actions
class app.views.layout.NavbarView extends Backbone.View
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
