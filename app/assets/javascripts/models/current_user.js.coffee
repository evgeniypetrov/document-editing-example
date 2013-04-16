class App.Models.CurrentUserModel extends Backbone.Model
  url: '/users/sessions'

  ### overrides ###
 
  defaults:
    user: null
