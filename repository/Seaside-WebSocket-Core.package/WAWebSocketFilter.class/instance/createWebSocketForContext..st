processing
createWebSocketForContext: aRequestContext
	| webSocket |
	webSocket := aRequestContext createWebSocket.
	(pushers
		at: (aRequestContext request fields
			at: WAWebSocket headerField
			ifAbsent: [ ^ nil ]))
		addSocket: webSocket.
		