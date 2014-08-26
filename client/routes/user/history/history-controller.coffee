# Set template name
templateName = "history"

# Collections
Template[templateName].notes = ->
  Meteor.subscribe 'notes'
  if Session.get("selectedStudent")
    Notes.find(studentId: Session.get("selectedStudent")._id).fetch()

# Events
Template[templateName].events 
  "click form#comment-form button[type='submit']": (e) ->
    e.preventDefault()

    if Session.get("selectedStudent")
      formData = $("form#comment-form").serializeArray()

      newNote = 
        authorId: Meteor.userId()
        studentId: Session.get("selectedStudent")._id
        createdAt: e.timeStamp

      _.each formData, (field) ->
        newNote[field.name] = field.value

      console.log newNote

      Notes.insert newNote, (error, result) ->
        $("form#comment-form").trigger("reset");

    return