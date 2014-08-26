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
      }
    });
  };

  /*
  if (Meteor.isServer) {
    Students.remove({});

    var sample = [
      {
        'sid': 13428,
        'name': 'Andrew'
      },
      {
        'sid': 21728,
        'name': 'Ben'
      },
      {
        'sid': 32637,
        'name': 'Chris'
      },
      {
        'sid': 41048,
        'name': 'David'
      }
    ]

    _.each(sample, function(data) {
      Students.insert(data);
    });
  }
  */
});
