class UserSerializer < Webmate::BasePresenter
  def to_serializable
    build_serialized default_resource do
      attributes :id, :login
    end
  end
end
