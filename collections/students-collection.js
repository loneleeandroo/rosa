Students = new Meteor.Collection('students');

Meteor.startup(function() {
  if (Meteor.isClient) {
    // sort alphabetically?
     
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
