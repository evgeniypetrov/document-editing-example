App.Collections or= {}

class App.Collections.ProjectsCollection extends Backbone.Collection
  model: App.Models.ProjectModel
  channel: 'api'
  resource: 'project' # projects

  initialize: () ->
    # do some code
    @bindSocketEvents()
