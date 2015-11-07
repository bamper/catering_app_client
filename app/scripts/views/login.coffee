define [
  'jquery'
  'underscore'
  'backbone'
  'templates'

  'instances/sessionModel'
], ($, _, Backbone, JST, sessionModel) ->
  class LoginView extends Backbone.View
    template: JST['app/scripts/templates/login.hbs']

    el: '#container'

    events:
      'submit form.login': 'submit'

    initialize: ->

    render: ->
      @$el.html @template()

    submit: (event) ->
      creds = $(event.currentTarget).serialize()
      # Without that submit event start multiplying on the login button
      this.undelegateEvents()
      sessionModel.login(creds)

      return false
