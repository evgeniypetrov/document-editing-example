App.Views.Layout or= {}

class App.Views.Layout.AppView extends Backbone.View
  className: 'main'
  #id

  initialize: (bootstrap_data) ->
    # bootstrap
    @projects     = new App.Collections.ProjectsCollection()
    @client = Webmate.connect @projects.channel, =>
      @projects.fetch()

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
