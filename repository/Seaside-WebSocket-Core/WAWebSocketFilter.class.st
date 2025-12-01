"
I WAWebSocketFilter can be added to any handler to receive incoming websocket communications requests and keep a websocket open.

"
Class {
	#name : 'WAWebSocketFilter',
	#superclass : 'WARequestFilter',
	#instVars : [
		'pushers'
	],
	#category : 'Seaside-WebSocket-Core',
	#package : 'Seaside-WebSocket-Core'
}

{ #category : 'processing' }
WAWebSocketFilter >> createWebSocketForContext: aRequestContext [
	| webSocket |
	webSocket := aRequestContext createWebSocket.
	(pushers
		at: (aRequestContext request fields
			at: WAWebSocket headerField
			ifAbsent: [ ^ nil ]))
		addSocket: webSocket.
		
]

{ #category : 'processing' }
WAWebSocketFilter >> handleFiltered: aRequestContext [
	(aRequestContext request isWebSocketSetupRequest)
		ifFalse: [ ^ super handleFiltered: aRequestContext ].
		
	self createWebSocketForContext: aRequestContext.
	
]

{ #category : 'initialization' }
WAWebSocketFilter >> initialize [
	super initialize.
	pushers := Dictionary new
]

{ #category : 'testing' }
WAWebSocketFilter >> isWebSocketFilter [
	^ true
]

{ #category : 'public' }
WAWebSocketFilter >> registerPusher: aPusher context: aContext [
	pushers at: aPusher id put: aPusher.
	^ aPusher id
]
