class App.Models.ProjectModel extends Backbone.Model

  getTasks: () ->
    @tasks or= @buildTasksCollection()

  buildTasksCollection: () ->
    new App.Collections.TasksCollection(null, { project_id: @id })
