var express = require('express');
var app = express();

var blocks = {
  'Fixed': 'Fastened securely in position',
  'Movable': 'Capable of being moved',
  'Rotating': 'Moving in a circle around its center'
};

app.get('/', function(request, response) {
  response.send('Hello world!');
});

app.get('/json', function(request, response) {
  response.send(blocks);
});

app.listen(8888, function() {
  console.log('Listening on port 8888');
});
