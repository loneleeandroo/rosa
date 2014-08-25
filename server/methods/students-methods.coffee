Meteor.methods
  getStudent: (studentId) ->
    Students.findOne studentId,
      fields:
        _id: 1
        name: 1
        sid: 1
