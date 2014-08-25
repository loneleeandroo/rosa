var filesStore = new FS.Store.GridFS('files' /*,{
  mongoUrl: 'mongodb://127.0.0.1:27017/test/', // optional, defaults to Meteor's local MongoDB
  mongoOptions: {...},  // optional, see note below
  transformWrite: myTransformWriteFunction, //optional
  transformRead: myTransformReadFunction, //optional
  maxTries: 1, // optional, default 5
  chunkSize: 1024*1024  // optional, default GridFS chunk size in bytes (can be overridden per file).
                        // Default: 2MB. Reasonable range: 512KB - 4MB
}*/
);

Files = new FS.Collection('files', {
  stores: [filesStore]
});

/*
Meteor.startup( function() {
  if (Meteor.isServer) {
    Files.remove({});
  }
});
*/