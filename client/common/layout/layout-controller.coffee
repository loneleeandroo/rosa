# Set template name
templateName = "layout"

# Rendered
Template[templateName].rendered = () ->

  snapper = new Snap(
    element: document.getElementById('content')
    disable: 'right'
    touchToDrag: true
  )
  window.snapper = snapper

  toggleSnapper = (mediaQuery) ->
    if mediaQuery.matches
      window.snapper.close()
      snapper.disable()
    else
      snapper.enable()

  mediaQuery = window.matchMedia("(min-width: 992px)")
  mediaQuery.addListener toggleSnapper
  toggleSnapper(mediaQuery) 
  return

# Collection
Template[templateName].student = ->
  Session.get("selectedStudent")