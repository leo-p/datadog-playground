const winston = require('winston');
var http = require('http');

const logger = winston.createLogger({});
logger.add(new winston.transports.Console({ format: winston.format.simple(), }))

http.createServer(function (req, res) {
  res.writeHead(200, { 'Content-Type': 'text/html' });
  res.end('Hello from Node.js!');
  logger.info({message: 'A new visit!'})
}).listen(5001);