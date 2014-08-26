# Set template name
templateName = "header"

# Collections
Template[templateName].student = ->
  return Session.get 'selectedStudent'

Template[templateName].user = ->
  return Meteor.user()

# Events
Template[templateName].events 
  "click button.navbar-drawer-toggle": (e) ->
    e.preventDefault()
    snapper = window.snapper
    if snapper.state().state is "left"
        snapper.close()
    else
        snapper.open 'left'
    return