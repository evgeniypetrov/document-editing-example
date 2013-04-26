class ProjectSerializer < Webmate::BasePresenter
  def to_serializable
    build_serialized default_resource do
      attributes :id, :name, :description

      attribute :status do
        @object.status
      end
    end
  end
end
