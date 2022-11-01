const tracer = require('dd-trace').init()

var http = require('http');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end('Hello from Node.js!');
}).listen(8080);