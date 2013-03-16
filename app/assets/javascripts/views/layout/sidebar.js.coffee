app.views.layout or= {}

# top header element - menu, user info, other actions
class app.views.layout.SidebarView extends Backbone.View
  className: 'sidebar'
  template: JST['templates/layout/sidebar']

  events:
    "click ul.menu li a" : "sidebarItemSelected"

  initialize: () ->
    # init

  render: () ->
    @$el.html(@template())
    @

  # events handlers
  sidebarItemSelected: (e) ->
    e.preventDefault()
    console.log('menuItemSelected')
