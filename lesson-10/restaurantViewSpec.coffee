class RestaurantView
  constructor: (@$el) ->
    @$reviewForm = @$el.find('[data-role="review"]')

    @_bindEvents()

  _bindEvents: ->
    @$el.on "click", '[data-role="toggle-schedule"]', @_toggleSchedule
    @$el.on "historyEnabled", @_enableHistoricalMode

  _toggleSchedule: =>
    @$el.toggleClass("is-displaying-full-schedule")

  _enableHistoricalMode: =>
    @$el.addClass("is-disabled")

    @$reviewForm
      .addClass("is-disabled")
      .find("input, select, button")
      .attr("disabled", "disabled")

describe "RestaurantView", ->
