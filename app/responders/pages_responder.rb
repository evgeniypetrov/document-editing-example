class PagesResponder < BaseResponder
  include Webmate::Responders::Templates

  def index
    slim :index, { layout: 'application' }, { name: 'hellow rold' }
  end
end
