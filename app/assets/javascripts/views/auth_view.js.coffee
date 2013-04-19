App.Views.Layout or= {}

# simple auth/register page
class App.Views.Layout.AuthView extends Backbone.View
  template: JST['templates/layout/login']

  events:
    "submit form.login-form" : 'userAuthClicked'
    "click form.login-form .buttons input" : 'userAuthClicked'
    "click a.test-login" : 'loginAsTestUserClicked'

  initialize: () ->
    # init

  render: () ->
    @$el.html(@template())
    @delegateEvents()
    @

  # event handlers
  userAuthClicked: (e) ->
    e.preventDefault()
    
    formData =
      user:
        login: 'webmate'
        email: 'webmate@example.com'
        password: '123456'
    @login(formData)

  loginAsTestUserClicked: (e) ->
    e.preventDefault()
    id = $(e.currentTarget).data('id')

    formData =
      user:
        login: "webmate#{id}"
        email: "webmate#{id}@example.com"
        password: '123456'

    @login(formData)

  login: (user_data) ->
    $.ajax
      url: '/users/sessions'
      dataType: 'JSON'
      type: "POST"
      data: user_data #JSON.stringify(formData)
      success: (model) ->
        window.App.View.current_user.set_current_user(model)

