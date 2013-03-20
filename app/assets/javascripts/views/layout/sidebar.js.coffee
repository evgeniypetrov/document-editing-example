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

    @projects.fetch(success: @render)

  render: () ->
    template_data = {
      projects: @projects.toJSON()
    }

    @$el.html(@template(template_data))
    @

  update: () ->
    @render()

  # events handlers
  sidebarItemSelected: (e) ->
    e.preventDefault()
    console.log('menuItemSelected')
