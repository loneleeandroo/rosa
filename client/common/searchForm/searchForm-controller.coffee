# Set template name
templateName = "searchForm"

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
  "click ul#student-list li": (e) ->
    window.snapper.close()

# Helpers
Template[templateName].helpers
  isUserSelected: (userId) ->
    "active"  if Session.get("selectedStudent") and userId is Session.get("selectedStudent")._id