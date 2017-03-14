const http     = require('http');
const nodeinfo = require('nodejs-info');

const server = http.createServer((req, res) => {
    res.writeHead(200, { "Content-Type": "text/html" });
    res.end(nodeinfo(req));
});

console.log('Node info service started on port 8001.');
server.listen(8001);
