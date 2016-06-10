$.fn.cssSelector = ->
  id = @attr('id')
  classes = @attr('class')

  if id then "##{id}" else classes.split(" ").join(".")

describe "$.fn.cssSelector", ->

