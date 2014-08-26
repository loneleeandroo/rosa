# Set template name
templateName = "files"

# Collections
Template[templateName].files = ->
  Meteor.subscribe 'files'
  if Session.get("selectedStudent")
    Files.find(studentId: Session.get("selectedStudent")._id).fetch()

# Events
Template[templateName].events 
  "change input.file-input": (e) ->
    # template data, if any, is available in 'this'
    if Session.get("selectedStudent")
      FS.Utility.eachFile e, (file) ->
        newFile = new FS.File(file)
        newFile.studentId = Session.get("selectedStudent")._id
        Files.insert newFile
        return
    return