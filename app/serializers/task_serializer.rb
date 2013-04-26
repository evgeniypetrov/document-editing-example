class TaskSerializer < Webmate::Serializers::Base
  attributes :id
  attributes :name
  attributes :project_id
  attributes :description, :status, :created_at

  def created_at
    object.created_at || Time.now
  end
end
