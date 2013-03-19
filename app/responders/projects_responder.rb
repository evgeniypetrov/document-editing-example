class ProjectsResponder < BaseResponder
  def read
    @projects = Project.all
    respond_with(@projects)
  end

  def index
    respond_with({})
  end
end
