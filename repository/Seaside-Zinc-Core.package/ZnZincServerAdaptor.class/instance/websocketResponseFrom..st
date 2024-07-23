converting
websocketResponseFrom: aRequestContext

	| wsdelegate webSocket |
	wsdelegate := (ZnSeasideWebSocketDelegate new handler: [ :ws | webSocket ifNotNil:[ :wasocket | wasocket znWebSocket: ws ] ]).
	((aRequestContext request isWebSocketSetupRequest) and: [ aRequestContext webSocket notNil ])
		ifTrue:[ 
			webSocket := aRequestContext webSocket.
			^ wsdelegate webSocketResponseForRequest: aRequestContext request ]
