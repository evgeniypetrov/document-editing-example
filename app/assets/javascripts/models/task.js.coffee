class App.Models.TaskModel extends Backbone.Model

  switchToNextStatus: (new_status) ->
    new_status ||= @getNextStatus()
    @save(
      { status: new_status },
      { wait: true }
    )

  getNextStatus: () ->
    statuses = ['red', 'yellow', 'green']
    status_index = statuses.indexOf(@get('status')) + 1
    new_status = statuses[status_index] || statuses[0]
