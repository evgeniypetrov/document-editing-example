App.Views.Layout or= {}

class App.Views.Layout.AppView extends Backbone.View
  className: 'main'
  #id

  initialize: (bootstrap_data) ->
    # bootstrap
    @projects     = new App.Collections.ProjectsCollection()
    @listenTo(@projects, 'reset', @chooseProject)

    # init channels
    #@client       = Webmate.connect('api')

    # views
    @navbar       = new App.Views.Layout.NavbarView()
    @sidebar      = new App.Views.Layout.SidebarView(projects: @projects)
    @grid         = new App.Views.Content.GridView()

  render: ->
    # render
    @$el.append(@navbar.render().el)
    @$el.append(@sidebar.render().el)
    @$el.append(@grid.render().el)

    @

  # helper
  chooseProject: ->
    if @projects.length > 0
      Backbone.trigger("project:selected", @projects.at(0))
      @stopListening(@projects, 'reset', @chooseProject)
