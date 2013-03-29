class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :description
  field :status

  field :created_at, type: Time

  belongs_to :project
end
