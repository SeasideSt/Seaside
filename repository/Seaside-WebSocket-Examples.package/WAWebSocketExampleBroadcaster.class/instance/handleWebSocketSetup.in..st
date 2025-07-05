handling
handleWebSocketSetup: aWAWebSocket in: aRequestContext
	
	"webSocket timeout: 300." "5 minutes timeout"
	
	Transcript cr; show: 'New ', aWAWebSocket printString.

	aWAWebSocket onMessage:[ :data |
		self socketsDo: [ :socket | socket send: data ] ].
	
	aWAWebSocket onClose:[
		Transcript cr; show: 'Closing ', aWAWebSocket printString.
		self removeSocket: aWAWebSocket ].
	
	aWAWebSocket onError:[ :exception |
		Transcript cr; show: aWAWebSocket.
		Transcript cr; show: exception description.
		Transcript cr; show: exception signalerContext longStack ].
	self addSocket: aWAWebSocket.
