class PagesResponder < BaseResponder
  class RenderingScope
    include Webmate::Views::Helpers
    include Sinatra::Cookies
    include Sinatra::Sprockets::Helpers

    def user_websocket_token
    end
  end

  def index
    #slim :"pages/index.html", layout: :'layouts/application.html'
    layout =  File.open('app/views/layouts/application.html.slim', 'rb').read
    contents =  File.open('app/views/pages/index.html.slim', 'rb').read

    l = Slim::Template.new { layout }
    c = Slim::Template.new { contents }.render(RenderingScope.new)

    l.render(RenderingScope.new) { c }
  end
end
