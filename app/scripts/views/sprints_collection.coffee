define [
  'jquery'
  'underscore'
  'backbone'
  'templates'

  'collections/sprints',

  'views/panel'
], ($, _, Backbone, JST, SprintsCollection, PanelView) ->
  class SprintsCollectionView extends Backbone.View
    template: JST['app/scripts/templates/sprints_collection.hbs']

    el: '#container'

    panel: new PanelView()

    events: {}

    initialize: () ->
      # @listenTo @model, 'change', @render

    render: () =>
      console.log()
      @$el.html @template(sprints: @collection.toJSON())

      @panel.$el = @$('#user_panel')
      @panel.render()
      @panel.delegateEvents()



