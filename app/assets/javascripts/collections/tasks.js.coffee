App.Collections or= {}

class App.Collections.TasksCollection extends Backbone.Collection
  model: App.Models.TaskModel
  channel: 'api'

  initialize: (data, options) ->
    # may be, we should do this with some kind of dsl
    @project_id = options.project_id
    @sync_data = {
      project_id: @project_id
    }
    # do some code
    @bindSocketEvents()

  url: ->
    "/projects/#{@project_id}/tasks"
