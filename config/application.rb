require 'digest/sha1'
require 'base64'

class WebmateApp < Webmate::Application
  authentication_for :user

  get '/' do
    slim :"pages/index.html", layout: :'layouts/application.html'
  end

  # channel definition example
  # channel 'channel_name', options do
  #   resource 'users',
  #     only: [:read, :update, :delete, :create, :get],
  #     responder: CustomUserResponder
  # end

  channel "api", {} do
    resources 'projects'
    resources 'tasks'
  end

#  channel 'channel', {} do
#    resources :projects
#  end
end
