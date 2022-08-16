handling
handleFiltered: aRequestContext
	| webSocket |
	webSocket := aRequestContext createWebSocket.
	
	"webSocket timeout: 300." "5 minutes timeout"
	
	Transcript cr; show: 'New ', webSocket printString.

	webSocket onMessage:[ :data |
		self socketsDo: [ :socket | socket send: data ] ].
	
	webSocket onClose:[
		Transcript cr; show: 'Closing ', webSocket printString.
		self removeSocket: webSocket ].
	
	webSocket onError:[ :exception |
		Transcript cr; show: webSocket.
		Transcript cr; show: exception description.
		Transcript cr; show: exception signalerContext longStack ].
	self addSocket: webSocket.
