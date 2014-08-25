# Set template name
templateName = "index"

# Route
Router.map ->
  @route templateName,
    path: "/user/:studentId"
    template: templateName
    onBeforeAction: (pause)->
      AccountsEntry.signInRequired this, pause
      return
    data: () ->
      Meteor.call 'getStudent', @params.studentId, (error, result) ->
        Session.set 'selectedStudent', result
      return
  return