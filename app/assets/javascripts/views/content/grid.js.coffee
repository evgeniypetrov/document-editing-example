App.Views.Content or= {}

# top header element - menu, user info, other actions
class App.Views.Content.GridView extends Backbone.View
  template: JST['templates/content/grid']
  className: 'calendar'

  events:
    "click ul.menu li a" : "menuItemSelected"
    "click #test_button" : "testButtonClicked"

  initialize: () ->
    # init
    @socket = new io.Socket
      resource: 'api'
      host: 'localhost'
      port: 3503
      force: true

  render: () ->
    @$el.html(@template())
    @

  # events handlers
  menuItemSelected: (e) ->
    e.preventDefault()
    console.log('menuItemSelected')

  testButtonClicked: (e) ->
    @socket.connect()
