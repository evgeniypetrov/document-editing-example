class User
  include Mongoid::Document
  include Webmate::Authentication::Model

  field :login

  has_many :tasks
end
