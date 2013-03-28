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

  initialize: () ->
    @listenTo(Backbone, "project:selected", @showTasksForProject)

  render: () ->
    @$el.html(@template())
    @

  # events handlers
  menuItemSelected: (e) ->
    e.preventDefault()
    console.log('menuItemSelected')

  # helper methods
  showTasksForProject: (project) ->
    #
