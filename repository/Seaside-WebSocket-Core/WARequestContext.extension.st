Extension { #name : 'WARequestContext' }

{ #category : '*seaside-websocket-core' }
WARequestContext >> createWebSocket [
	self webSocket ifNotNil:[ Error signal: 'WAWebSocket already created' ].
	^ self properties at: #webSocket put: (self webSocketCreator newWebSocketInRequestContext: self)
]

{ #category : '*seaside-websocket-core' }
WARequestContext >> webSocketCreator [
	^ self properties at: #webSocketCreator
]

{ #category : '*seaside-websocket-core' }
WARequestContext >> webSocketCreator: aWebSocketCreator [
	self properties at: #webSocketCreator put: aWebSocketCreator
]
