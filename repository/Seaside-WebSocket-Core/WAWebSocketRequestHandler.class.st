"
I am the superclass of a request handler that deals specifically with websocket calls. 

Seaside applications can either use the WAWebsocketFilter to handle websocket communications in the application itself, or they can use a separately registered websocket request handler.
"
Class {
	#name : 'WAWebSocketRequestHandler',
	#superclass : 'WARequestHandler',
	#category : 'Seaside-WebSocket-Core',
	#package : 'Seaside-WebSocket-Core'
}

{ #category : 'handling' }
WAWebSocketRequestHandler >> handleFiltered: aRequestContext [ 
	(aRequestContext request isWebSocketSetupRequest)
		ifFalse:[ ^ super handleFiltered: aRequestContext ].
	self handleWebSocketSetup: aRequestContext createWebSocket in: aRequestContext
]

{ #category : 'handling' }
WAWebSocketRequestHandler >> handleWebSocketSetup: aWAWebSocket in: aRequestContext [
	"Override on subclass to implement websocket setup"
	self subclassResponsibility
]
