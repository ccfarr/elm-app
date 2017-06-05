// Libraries and setup
var express = require('express');
var app = express();
var pg = require('pg');

// Hello world!
app.get('/', function(request, response) {

  // Send Hello World response
  response.send('Hello world!');

  // Send file index.html as response
  // response.sendFile(__dirname + '/index.html');
});

// Return json
app.get('/json', function(request, response) {

  // Establish connection
  var client = new pg.Client('postgres://postgres@172.17.0.1:9000/postgres');

  // Connect to postgres client
  client.connect(function (err) {

    // Handle error if needed
    if (err) throw err;

    // Get number of votes from database
    client.query('SELECT id, option_name, number_of_votes FROM votes ORDER BY id', function (err, result) {

    // Handle error if needed
    if (err) throw err;

    // Respond with result set in json format
    response.send(result.rows);
    });
  });
});

// Listen on port 8888
app.listen(8888, function() {

  // Send message to console
  console.log('Listening on port 8888');
});
