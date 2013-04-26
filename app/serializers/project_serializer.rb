class ProjectSerializer < Webmate::Serializers::Base
  attributes :id, :name, profile: :default
end

=begin
class ProjectSerializer < Webmate::BaseSerializer
#  def to_serializable
#    build_serialized default_resource do
#      attributes :id, :name
#    end 
#  end 
  
  def to_serializable
    build_serialized @resources do
      attributes :id, :name
    end
  end
end
=end
