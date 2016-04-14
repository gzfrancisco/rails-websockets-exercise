var scheme = 'ws://';
var uri = scheme + window.document.location.host + '/';
window.ws = new WebSocket(uri);

ws.onmessage = function (message) {
  console.log(message);
}
function send_message (event) {
  event.preventDefault();
  window.ws.send('Mensaje desde cliente');
}
