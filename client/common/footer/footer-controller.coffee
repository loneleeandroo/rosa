# Set template name
templateName = "footer"

# Collection
Template[templateName].studentId = ->
  Session.get("selectedStudent")._id

# Helpers
Template[templateName].helpers
  isProfileSectionSelected: (profileSection) ->
    "active" if profileSection is Session.get("profileSection")