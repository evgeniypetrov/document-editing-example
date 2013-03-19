class WebmateApp < Webmate::Application
  set :port, 3503

  authentication_for :user

  get '/' do
    slim :"pages/index.html", layout: :'layouts/application.html'
#    if user_signed_in?
#      slim :"pages/index"
#    else
#      redirect '/users/sign_in'
#    end
  end

  channel "api" do
    get "projects/read" => ProjectsResponder
  end

  #channel "projects" do
  #  get 'read' => ProjectsResponder 
  #end
end
