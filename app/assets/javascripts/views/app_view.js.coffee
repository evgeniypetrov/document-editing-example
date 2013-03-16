app.views.layout or= {}

class app.views.layout.AppView extends Backbone.View
  className: 'main'
  #id

  initialize: (bootstrap_data) ->
    @navbar       = new app.views.layout.NavbarView()
    @sidebar      = new app.views.layout.SidebarView()
    @calendar     = new app.views.content.CalendarView()

  render: ->
    # render
    @$el.append(@navbar.render().el)
    @$el.append(@sidebar.render().el)
    @$el.append(@calendar.render().el)

    @
