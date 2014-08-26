# Set template name
templateName = "layout"

# Rendered
Template[templateName].rendered = () ->
  snapper = new Snap(
    element: document.getElementById('content')
    disable: 'right'
  )
  window.snapper = snapper
  return