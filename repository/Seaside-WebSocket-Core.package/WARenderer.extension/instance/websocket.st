*Seaside-WebSocket-Core
websocket
	^ (JSWebSocket context: self context)
		rendererClass: self species;
		yourself