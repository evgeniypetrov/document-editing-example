class App.Models.CurrentUserModel extends Backbone.Model
  #url: '/users/sessions'
 
  defaults:
    user: null

  ### overrides ###
  initialize: (user) ->
    @set_current_user(user) if user
    #@listenTo(Backbone, 'user:logged_in', @set_current_user)

  set_current_user: (user) ->
    if user && user.constructor != App.Models.UserModel
      user = new App.Models.UserModel(user)
    @set(user: user)

    if user
      Backbone.trigger("user:logged_in", user)
    else
      Backbone.trigger("user:logged_out", user)

  loggedIn: () ->
    user = @get('user')
    user && user.get('id')?

  logout: () ->
    $.ajax
      url: '/users/sessions'
      dataType: 'JSON'
      type: "DELETE"
      success: (model) ->
        Webmate.Auth.unAuthorize()
        window.App.CurrentUser.set_current_user(null)
