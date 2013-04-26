class TaskSerializer < Webmate::BasePresenter
  def to_serializable
    build_serialized default_resource do
      attributes :id, :name, :project_id, :status
    end
  end
end
