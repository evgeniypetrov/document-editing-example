class PagesResponder < BaseResponder
  class RenderingScope
    include Webmate::Views::Helpers
    include Sinatra::Cookies
    include Sinatra::Sprockets::Helpers

    def initialize(responder)
      @responder = responder
    end

    def user_websocket_token
    end

    def current_user
      @responder.request.env['warden'].user('user')
    end

    def current_user_id
      @responder.request.env['warden'].user('user').id
    end
  end

  def index
    #@request.env['warden'].env['rack.session']

    #slim :"pages/index.html", layout: :'layouts/application.html'
    layout =  File.open('app/views/layouts/application.html.slim', 'rb').read
    contents =  File.open('app/views/pages/index.html.slim', 'rb').read

    l = Slim::Template.new { layout }
    c = Slim::Template.new { contents }.render(RenderingScope.new(self))

    l.render(RenderingScope.new(self)) { c }
  end
end
