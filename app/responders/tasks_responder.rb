class TasksResponder < BaseResponder

  private

  def project
    @project ||= Project.find(params[:project_id])
  end

  def task
    @task ||= project.tasks.where(id: params[:task_id]).first
  end

  def all_users
    User.all.map(&:id)
  end

  public

  def read_all
    project.tasks.to_json(methods: [:id])
  end

  def create
    task = project.tasks.build(name: params[:name])

    if task.save
      publish_to(all_users)
      respond_with task.to_json(methods: [:id])
    else
      {}
    end
  end

  def update
    publish_to(all_users)

    task.update_attributes(
      status: params[:status]
    )
    task.to_json(methods: [:id])
  end

  def delete
    publish_to(all_users)

    task.destroy
    task.to_json(methods: [:id])
  end
end
