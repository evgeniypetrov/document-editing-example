App.Views.Layout or= {}

# short cat
# window.App.View.sidebar.projects

# top header element - menu, user info, other actions
class App.Views.Layout.SidebarView extends Backbone.View
  className: 'sidebar'
  template: JST['templates/layout/sidebar']

  events:
    "click ul.menu li a" : "sidebarItemSelected"

  initialize: (options) ->
    @projects = options.projects
    # init

    # set hooks to track
    @listenTo(@projects, 'change', @update)
    @listenTo(@projects, 'reset', @update)

    @projects.fetch()

    # global
    @listenTo(Backbone, "project:selected", @selectProject)

  render: () ->
    template_data = {
      projects: @projects.toJSON(),
      selected_id: @selected_project_id
    }

    @$el.html(@template(template_data))
    @

  update: () ->
    @render()

  # events handlers
  sidebarItemSelected: (e) ->
    e.preventDefault()
    project = @projects.get($(e.currentTarget).data('id'))
    Backbone.trigger("project:selected", project)

  # helper methods
  selectProject: (project) ->
    @selected_project_id = project.id
    @$el.find("ul.menu li")
      .removeClass("selected")
      .find("a[data-id=#{project.id}]").closest("li")
      .addClass("selected")
