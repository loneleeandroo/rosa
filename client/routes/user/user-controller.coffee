# Set template name
templateName = "user"

# Route
Router.map ->
  @route "profile",
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
  return

subpages = ["files", "academics", "history"]

_.each subpages, (subpage) ->
  Router.map ->
    @route subpage,
      path: "/user/:studentId/" + subpage
      template: subpage
      onBeforeAction: (pause)->
        AccountsEntry.signInRequired this, pause
        return
      data: () ->
        Meteor.call 'getStudent', @params.studentId, (error, result) ->
          Session.set 'selectedStudent', result
        Session.set 'profileSection', subpage
        return
    return

# Collections
Template[templateName].student = ->
  return Session.get 'selectedStudent'