# Set template name
templateName = "header"

# Collections
Template[templateName].student = ->
  return Session.get 'selectedStudent'

Template[templateName].user = ->
  return Meteor.user()