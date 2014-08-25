Meteor.startup () ->
  Meteor.publish 'files', () ->
    Files.find()