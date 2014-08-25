# Set template name
templateName = "profile"

# Route
Router.map ->
  @route templateName,
    path: "/" + templateName
    onBeforeAction: ->
      AccountsEntry.signInRequired this
      return
  return