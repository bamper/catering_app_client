define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
  'jquery_ui'
  'channel'

  'views/helpers'
], ($, _, Backbone, JST, ui, channel, Helpers) ->
  class SideBarView extends Backbone.View
    template: JST['app/scripts/templates/sideBar.hbs']

    initialize: (sprint, days) ->
      @sprint = sprint
      @days = days
      this.listenTo @days, "reset", this.render
      # this.listenTo @dishes, "add", this.render
      this.listenTo channel, "sideBar:dishAdded", @addDish
      this.listenTo channel, "sideBar:dishRemoved", @removeDish

    # Change current day on the sidebar
    # changeDay: ->

    addDish: (dish, day_id) ->
      console.log(dish)
      console.log(day_id)

    removeDish: (dish, day_id) ->
      console.log(dish)
      console.log(day_id)

    render: ->
      @$el.html @template(days: @days.toJSON())
      return this

    # renderDays: ->
    #   daysView = new DaysCollectionView({ collection: @days })
    #   daysView.$el = @$('#days')
    #   daysView.render()
    #   daysView.delegateEvents()
    #   return this
