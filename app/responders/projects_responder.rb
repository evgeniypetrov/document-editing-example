class ProjectsResponder < BaseResponder
  def read
    @project = Project.new
    #respond_with @project.to_json(methods: [:id])
    respond_with ProjectSerializer.new(@project).to_json
  end

  def read_all
    @projects = Project.all

    #respond_with @projects.to_json(methods: [:id])
    respond_with ProjectSerializer.new(@projects.to_a).to_json
  end
end

