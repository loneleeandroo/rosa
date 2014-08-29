# Set template name
templateName = "addNewStudent"

# Events
Template[templateName].events 
  "click button[type='submit']": (e) ->
    e.preventDefault()

    newStudent = {}
    formData = $('form#add-new-student').serializeArray()

    _.each formData, (field) ->
      newStudent[field.name] = field.value

    Students.insert newStudent
    $('#addNewStudent').modal('hide')    

    return