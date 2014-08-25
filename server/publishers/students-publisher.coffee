Meteor.startup () ->
  Meteor.FilterCollections.publish Students, 
    name: 'filteredStudents'