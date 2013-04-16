App.Views.Layout or= {}

class App.Views.Layout.AppView extends Backbone.View
  className: 'main'
  #id

  initialize: (bootstrap_data) ->
    @bootstrap_data = bootstrap_data

    if Webmate.Auth.isAuthorized()
      @showPrivatePage()
    else
      @showAuthorizationPage()

    @authorizeUser()

    @listenTo(Backbone, 'user:authorized', @showPrivatePage)

  authorizeUser: ->
    Webmate.Auth.getToken (token) ->
      Backbone.trigger('user:authorized', { token: token })

  showAuthorizationPage: () ->
    @auth_page    = new App.Views.Layout.AuthView()

  showPrivatePage: () ->
    # bootstrap
    @projects     = new App.Collections.ProjectsCollection()
    @listenTo(@projects, 'reset', @chooseProject)

    # views
    @navbar       = new App.Views.Layout.NavbarView()
    @sidebar      = new App.Views.Layout.SidebarView(projects: @projects)
    @grid         = new App.Views.Content.GridView()

  render: ->
    if Webmate.Auth.isAuthorized()
      # render
      @$el.append(@navbar.render().el)
      @$el.append(@sidebar.render().el)
      @$el.append(@grid.render().el)
    else
      @$el.append(@auth_page.render().el)

    @

  # helper
  chooseProject: ->
    if @projects.length > 0
      Backbone.trigger("project:selected", @projects.at(0))
      @stopListening(@projects, 'reset', @chooseProject)
