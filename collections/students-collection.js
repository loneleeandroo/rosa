Students = new Meteor.Collection('students');

Meteor.startup(function() {
  if (Meteor.isClient) {
    // sort alphabetically?
    StudentFilter = new Meteor.FilterCollections(Students, {
      name: "filteredStudents",
      template: "searchForm",
      filters: {
        name: {
          title: "Name",
          operator: ["$regex", "i"],
          condition: "$and",
          searchable: "required"
        }
      },
      callbacks: {
        templateRendered: function(template) {
          Deps.autorun( function() {
            if( StudentFilter.query.getResults().fetch() ) {
              var scroller = new IScroll( $('#search-form-content')[0], {
                click: true
              });
            }
          });
        }
      }
    });
  };
});
