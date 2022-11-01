var http = require('http');
const tracer = require('dd-trace').init()

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end('Hello from Node.js!');
}).listen(5001);