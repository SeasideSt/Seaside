converting
websocketSetupResponseFrom: aRequestContext

	| wsdelegate webSocket wsDelegateClass |
	webSocket := aRequestContext webSocket.
	wsDelegateClass := Smalltalk at: #ZnSeasideWebSocketDelegate ifAbsent: [ Error signal: 'Seaside-WebSocket-Zinc not loaded' ].
	wsdelegate := wsDelegateClass new handler: [ :ws |
		              webSocket ifNotNil: [ :wasocket | wasocket znWebSocket: ws ] ].
	^ wsdelegate webSocketResponseForRequest: aRequestContext request