rendering
renderContentOn: html
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