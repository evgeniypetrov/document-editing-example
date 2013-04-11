class TasksResponder < BaseResponder

  private

  def project
    @project ||= Project.find(params[:project_id])
  end

  def task
    @task ||= project.tasks.where(id: params[:task_id]).first
  end

  def redis_channel
    "project/#{project.id}/tasks"
  end

  public

  def read_all
    subscribe_to(redis_channel)
    project.tasks.to_json(methods: [:id])
  end

  def create
    publish_to(redis_channel, for: :all)

    task = project.tasks.build(name: params[:name])
    task.save ? task : {}

    task.to_json(methods: [:id])
  end

  def update
    publish_to(redis_channel, for: :all)

    task.update_attributes(
      status: params[:status]
    )
    task.to_json(methods: [:id])
  end

  def delete
    publish_to(redis_channel, for: :all)
    task.destroy
    task.to_json(methods: [:id])
  end
end
