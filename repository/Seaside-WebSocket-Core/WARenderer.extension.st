Extension { #name : 'WARenderer' }

{ #category : '*Seaside-WebSocket-Core' }
WARenderer >> websocket [
	^ (JSWebSocket context: self context)
		rendererClass: self species;
		yourself
]
