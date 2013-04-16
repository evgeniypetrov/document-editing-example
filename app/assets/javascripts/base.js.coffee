JST = window.JST = window.JST or {}

window.App = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  start: (data) ->
    # load bootstrap
    window.App.View = new App.Views.Layout.AppView(data)
    $('#container').html(window.App.View.render().el)

    #new ExampleApp.Routers.Tasks({ tasks: tasks });
    #Backbone.history.start();
}
