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

# Collections
Template[templateName].files = ->
  Meteor.subscribe 'files'
  if Session.get("selectedStudent")
    Files.find(studentId: Session.get("selectedStudent")._id).fetch()

Template[templateName].notes = ->
  Meteor.subscribe 'notes'
  if Session.get("selectedStudent")
    Notes.find(studentId: Session.get("selectedStudent")._id).fetch()

# Events
Template[templateName].events 
  "keyup form#search-form input": (e) ->
    e.preventDefault()

    search = e.target.value

    if search
      StudentFilter.search.setCriteria search, true
      StudentFilter.search.run()
    else
      StudentFilter.search.clear()
    return

  "click form#comment-form button[type='submit']": (e) ->
    e.preventDefault()

    if Session.get("selectedStudent")
      formData = $("form#comment-form").serializeArray()

      newNote = 
        authorId: Meteor.userId()
        studentId: Session.get("selectedStudent")._id

      _.each formData, (field) ->
        newNote[field.name] = field.value

      Notes.insert newNote, (error, result) ->
        $("form#comment-form").trigger("reset");

    return

  "change input.file-input": (e) ->
    # template data, if any, is available in 'this'
    if Session.get("selectedStudent")
      FS.Utility.eachFile e, (file) ->
        newFile = new FS.File(file)
        newFile.studentId = Session.get("selectedStudent")._id
        Files.insert newFile
        return
    return

# Helpers
Template[templateName].helpers
  isUserSelected: (userId) ->
    "active"  if Session.get("selectedStudent") and userId is Session.get("selectedStudent")._id