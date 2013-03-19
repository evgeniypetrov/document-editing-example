class Project
  include Mongoid::Document

  field :name
  field :description
  field :status
end
