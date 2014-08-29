Meteor.methods
  getStudent: (studentId) ->
    Students.findOne studentId,
      fields:
        _id: 1
        firstname: 1
        lastname: 1
        sid: 1
