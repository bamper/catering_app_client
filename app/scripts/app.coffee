define [
  'jquery',
  'underscore',
  'backbone',
  'router',

  'models/session'

  'views/contacts',
  'views/login',
  'views/sprints'
], ($, _, Backbone, Router, Session, ContactsView, LoginView, SprintsView) ->
  class Application
    @defaults =
      api_endpoint: "http://127.0.0.1:3000/api/v1"

    Backbone.emulateJSON = true

    constructor: (options = {}) ->
      @router = null
      @options = $.extend(Application.defaults, options)
      @session = null

    initialize: () ->
      this._initConfiguration()
      this._initRoutes()
      this._initEvents()


    _initConfiguration: ->
      self = this

      $.ajaxPrefilter((options, originalOptions, jqXHR) ->
        options.url = "#{self.options.api_endpoint}/#{options.url}"
      )

    _initRoutes: ->
      @router = new Router()

      @router.on 'route:login', (page) ->
        _view = new LoginView()
        _view.render()

      @router.on 'route:contacts', (page) ->
        _view = new ContactsView()
        _view.render()

      @router.on 'route:sprints', (page) ->
        _view = new SprintsView()
        _view.render()

      Backbone.history.start()

    _initEvents: ->
      self = this

      Session.on 'change', (session) ->
        console.log("Change")
        console.log(session)

      Session.on 'change:auth', (session) ->
        self.checkAuth()

      # Session.on 'request', (model, xhr, options) ->
      #   console.log(model)
      #   console.log(xhr)
      #   console.log(options)

      # Check if user already logined
      # Session.getAuth(callback)

    checkAuth: ->
      if Session.get('auth') is true
        @router.navigate("sprints", {trigger: true})
      else
        @router.navigate("contacts", {trigger: true})

  return new Application()
