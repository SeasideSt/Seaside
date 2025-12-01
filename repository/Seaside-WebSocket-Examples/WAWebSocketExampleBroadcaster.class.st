Class {
	#name : 'WAWebSocketExampleBroadcaster',
	#superclass : 'WAWebSocketRequestHandler',
	#instVars : [
		'sockets',
		'mutex'
	],
	#category : 'Seaside-WebSocket-Examples',
	#package : 'Seaside-WebSocket-Examples'
}

{ #category : 'accessing' }
WAWebSocketExampleBroadcaster class >> description [
	^ 'WebSocket example broadcaster'
]

{ #category : 'initialization' }
WAWebSocketExampleBroadcaster class >> initialize [
	WAAdmin register: self at: 'examples/websockets/broadcast'
]

{ #category : 'private' }
WAWebSocketExampleBroadcaster >> addSocket: aWebSocket [
	mutex critical: [
		sockets add: aWebSocket ]
]

{ #category : 'handling' }
WAWebSocketExampleBroadcaster >> handleWebSocketSetup: aWAWebSocket in: aRequestContext [
	
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

]

{ #category : 'initialization' }
WAWebSocketExampleBroadcaster >> initialize [
	super initialize.
	sockets := OrderedCollection new.
	mutex := WAMutex new
]

{ #category : 'private' }
WAWebSocketExampleBroadcaster >> removeSocket: aWebSocket [
	mutex critical: [
		sockets remove: aWebSocket ifAbsent: [ ] ]
]

{ #category : 'private' }
WAWebSocketExampleBroadcaster >> socketsDo: aOneArgumentBlock [
	mutex critical: [
		sockets do: aOneArgumentBlock ]
]
