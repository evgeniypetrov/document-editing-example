class Task
  include Mongoid::Document

  field :name
  field :description
  field :status

  field :created_at, type: Time

  belongs_to :project
end
