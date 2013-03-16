JST = window.JST = window.JST or {}

window.app = {
  models: {},
  collections: {},
  views: {},
  routers: {},
  start: (data) ->
    # load bootstrap
    window.app.view = new app.views.layout.AppView(data)
    $('#container').replaceWith(window.app.view.render().el)

    #new ExampleApp.Routers.Tasks({ tasks: tasks });
    #Backbone.history.start();
}
