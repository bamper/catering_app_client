define [
  'underscore'
  'backbone'

  'instances/sessionModel'

  'models/sprint'
], (_, Backbone, sessionModel, SprintModel) ->

  class SprintsCollection extends Backbone.Collection

    model: SprintModel

    initialize: () ->
      $.ajaxPrefilter( (options, originalOptions, jqXHR) ->
        options.xhrFields = { withCredentials: true }

        if sessionModel.get('auth_token')
          jqXHR.setRequestHeader('X-Auth-Token', sessionModel.get('auth_token'))
      )

      @url = 'sprints'
      this.fetch()
