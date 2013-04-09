class ProjectsResponder < BaseResponder
  def read
    @project = Project.new
    respond_with @project.to_json(methods: [:id])
  end

  def read_all
    @projects = Project.all
    respond_with @projects.to_json(methods: [:id])
  end
end
