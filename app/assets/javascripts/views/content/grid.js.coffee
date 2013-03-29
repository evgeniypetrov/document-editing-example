App.Views.Content or= {}

# top header element - menu, user info, other actions
class App.Views.Content.GridView extends Backbone.View
  template: JST['templates/content/grid']
  className: 'calendar'

  events:
    "click ul.menu li a" : "menuItemSelected"
    "click a.new_task" : "addNewTaskClicked"
    "click a.delete_task" : "deleteTaskClicked"
    "click tr.task td.status" : "changeTaskStatusClicked"

  initialize: () ->
    @listenTo(Backbone, "project:selected", @showTasksForProject)

  render: () ->
    template_data = {}
    template_data.tasks = @tasks.toJSON() if @tasks?

    @$el.html(@template(template_data))
    @

  # events handlers
  menuItemSelected: (e) ->
    e.preventDefault()
    console.log('menuItemSelected')

  addNewTaskClicked: (e) ->
    e.preventDefault()
    task_name = "Task - #{(new Date).getTime().toString()}"
    task = @tasks.create({name: task_name}, {wait: true})

  deleteTaskClicked: (e) ->
    e.preventDefault()
    task = @tasks.get($(e.currentTarget).closest('tr.task').data('id'))
    task.destroy()
    # remove it

  changeTaskStatusClicked: (e) ->
    e.preventDefault()
    task = @tasks.get($(e.currentTarget).closest('tr.task').data('id'))
    task.switchToNextStatus()

  # helper methods
  showTasksForProject: (project) ->
    @current_project = project
    @tasks = project.getTasks()

    @listenTo(@tasks, 'add', @render)
    @listenTo(@tasks, 'remove', @render)
    @listenTo(@tasks, 'change', @render)
    @listenTo(@tasks, 'reset', @render)

    @tasks.fetch()
