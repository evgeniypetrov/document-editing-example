App.Collections or= {}

class App.Collections.TasksCollection extends Backbone.Collection
  model: App.Models.TaskModel
  channel: 'api'
  resource: 'task' # tasks

  initialize: (data, options) ->
    # may be, we should do this with some kind of dsl
    @project_id = options.project_id
    @sync_data = {
      project_id: @project_id
    }
    # do some code
    @bindSocketEvents()
