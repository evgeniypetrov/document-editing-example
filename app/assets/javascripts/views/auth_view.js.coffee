App.Views.Layout or= {}

# simple auth/register page
class App.Views.Layout.AuthView extends Backbone.View
  template: JST['templates/layout/login']

  events:
    "submit form.login-form" : 'userAuthClicked'
    "click form.login-form .buttons input" : 'userAuthClicked'

  initialize: () ->
    # init

  render: () ->
    @$el.html(@template())
    @

  # event handlers
  userAuthClicked: (e) ->
    e.preventDefault()
    
    formData =
      login: 'guest'
      password: '123'

    $.ajax
      url: '/users/sessions'
      dataType: 'JSON'
      type: "POST"
      data: formData #JSON.stringify(formData)
      success: (model) ->
        console.log(model)

    # auth user
