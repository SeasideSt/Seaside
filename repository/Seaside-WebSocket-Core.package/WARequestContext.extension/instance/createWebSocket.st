*seaside-websocket-core
createWebSocket
	self webSocket ifNotNil:[ Error signal: 'WAWebSocket already created' ].
	^ self properties at: #webSocket put: (self webSocketCreator newWebSocketInRequestContext: self)