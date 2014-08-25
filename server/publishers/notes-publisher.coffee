Meteor.startup () ->
  Meteor.publish 'notes', () ->
    Notes.find()