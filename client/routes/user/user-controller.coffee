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
      Session.set 'profileSection', 'profile'
      return
  @route templateName,
    path: "/user/:studentId/:profileSection"
    template: templateName
    onBeforeAction: (pause)->
      AccountsEntry.signInRequired this, pause
      return
    data: () ->
      Meteor.call 'getStudent', @params.studentId, (error, result) ->
        Session.set 'selectedStudent', result
      Session.set 'profileSection', @params.profileSection
      return
  return