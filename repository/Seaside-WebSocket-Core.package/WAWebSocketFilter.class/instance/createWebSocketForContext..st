processing
createWebSocketForContext: aRequestContext
	| webSocket |
	webSocket := aRequestContext createWebSocket.
	(pushers
		at: (aRequestContext request fields
			at: JSWebSocket headerField
			ifAbsent: [ ^ nil ]))
		addSocket: webSocket.
		