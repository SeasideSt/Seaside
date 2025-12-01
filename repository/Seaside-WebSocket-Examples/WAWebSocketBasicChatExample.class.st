Class {
	#name : 'WAWebSocketBasicChatExample',
	#superclass : 'WAComponent',
	#category : 'Seaside-WebSocket-Examples',
	#package : 'Seaside-WebSocket-Examples'
}

{ #category : 'initialization' }
WAWebSocketBasicChatExample class >> initialize [
	WAAdmin register: self asApplicationAt: 'examples/websockets/basic-chat'
]

{ #category : 'rendering' }
WAWebSocketBasicChatExample >> renderContentOn: html [
	html paragraph: 'I am a simple demonstration of Seaside-WebSocket basic usage: WAWebSocketExampleBroadcaster is a WARequestHandler that manages websocket connection requests and broadcasts any message received to all open websocket connections.'.
	html paragraph
		id: 'status';
		with: 'WebSocket: Not connected'.
	html basicForm: [
		html textInput
			id: 'chat';
			placeholder: 'type and press enter to chat' ].
	html paragraph: 'To test, open two windows with this example application, type a message above and press return. '.
	html unorderedList
		id: 'log'.
		
	self renderJavaScriptOn: html
]

{ #category : 'rendering' }
WAWebSocketBasicChatExample >> renderJavaScriptOn: html [
	html script: '
var conn = {};
var log = document.getElementById("log");
var chat = document.getElementById("chat");
var form = chat.form;
var state = document.getElementById("status"); 
 
if (window.WebSocket === undefined) {
  state.innerHTML = "(WebSockets not supported)";
} else {
    conn = new WebSocket("ws://localhost:8080/examples/websockets/broadcast");
    conn.onopen = function () {
      state.innerHTML = "WebSocket: Connected";
    };
 
    conn.onmessage = function (event) {
      log.innerHTML = "<li>" + event.data + "</li>" + log.innerHTML;
    };
    
    conn.onclose = function (event) {
      state.innerHTML = "WebSocket: Closed";
    };

	form.addEventListener("submit", function (event) {
		event.preventDefault();
		if (conn.readyState === 1) {
			conn.send(chat.value);      
			chat.value = "";
		}
	}, false);
};'
]

{ #category : 'updating' }
WAWebSocketBasicChatExample >> updateRoot: root [
	super updateRoot: root.
	root title: 'WebSocket Example'
	
]
