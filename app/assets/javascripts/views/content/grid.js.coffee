App.Views.Content or= {}

# short cat
# window.App.View.grid.projects
# App.View.grid.socket()

# top header element - menu, user info, other actions
class App.Views.Content.GridView extends Backbone.View
  template: JST['templates/content/grid']
  className: 'calendar'

  events:
    "click ul.menu li a" : "menuItemSelected"
    "click #test_button" : "testButtonClicked"

  initialize: () ->
    # init

  render: () ->
    @$el.html(@template())
    @

  socket: () ->
    @_socket or= @build_socket()

  build_socket: () ->
    socket = new io.Socket
      resource: 'channel'
      host: 'localhost'
      port: 3503
      force: true

    socket.onPacket = (msg) ->
      console.log('onPacket fetched')
      console.log(msg)

    socket.on("connect", (data) ->
      console.log('connect packet')
      console.log(data)
    )

    socket.connect()
    socket

  # events handlers
  menuItemSelected: (e) ->
    e.preventDefault()
    console.log('menuItemSelected')

  testButtonClicked: (e) ->
    #@socket().connect()
    valid_message_data = {
      resource: 'projects'
      action: 'read'
    }
    
    num = Math.random()
    @socket().packet({ type: 'message', data: JSON.stringify(valid_message_data)})
