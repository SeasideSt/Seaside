Extension { #name : 'ZnZincServerAdaptor' }

{ #category : '*Seaside-WebSocket-Zinc' }
ZnZincServerAdaptor >> contextFor: aZnRequest [
	| context |
	context := super contextFor: aZnRequest.
	(context request isWebSocketSetupRequest)
		ifTrue:[ context webSocketCreator: WAZincWebSocketCreator new ].
	^ context
]

{ #category : '*Seaside-WebSocket-Zinc' }
ZnZincServerAdaptor >> websocketSetupResponseFrom: aRequestContext [

	| wsdelegate webSocket |
	webSocket := aRequestContext webSocket.
	wsdelegate := ZnSeasideWebSocketDelegate new handler: [ :ws | webSocket ifNotNil: [ :wasocket | wasocket znWebSocket: ws ] ].
	^ wsdelegate webSocketResponseForRequest: aRequestContext request
]
