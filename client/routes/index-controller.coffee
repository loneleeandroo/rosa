# Set template name
templateName = "index"

# Route
Router.map ->
  @route templateName,
    path: "/"
    onBeforeAction: (pause)->
      AccountsEntry.signInRequired this, pause
      return
    data: () ->
      Session.set('selectedStudent', null) 
      return
  return