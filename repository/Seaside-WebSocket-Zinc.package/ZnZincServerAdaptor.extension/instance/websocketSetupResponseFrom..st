*Seaside-WebSocket-Zinc
websocketSetupResponseFrom: aRequestContext

	| wsdelegate webSocket |
	webSocket := aRequestContext webSocket.
	wsdelegate := ZnSeasideWebSocketDelegate new handler: [ :ws | webSocket ifNotNil: [ :wasocket | wasocket znWebSocket: ws ] ].
	^ wsdelegate webSocketResponseForRequest: aRequestContext request