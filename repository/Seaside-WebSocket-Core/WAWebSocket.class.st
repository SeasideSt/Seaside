"
I am the abstract superclass for the platform-specific implementation of a server-side websocket.
"
Class {
	#name : 'WAWebSocket',
	#superclass : 'GRObject',
	#instVars : [
		'session',
		'onMessage',
		'onClose',
		'onError'
	],
	#category : 'Seaside-WebSocket-Core',
	#package : 'Seaside-WebSocket-Core'
}

{ #category : 'configuration' }
WAWebSocket class >> headerField [

	^ '_ws'
]

{ #category : 'initialization' }
WAWebSocket >> initializeWithRequestContext: aRequestContext [

	self initialize.
	session := aRequestContext session.
]

{ #category : 'testing' }
WAWebSocket >> isConnected [

	self subclassResponsibility
]

{ #category : 'callbacks' }
WAWebSocket >> onClose: aBlock [

	onClose := aBlock
]

{ #category : 'callbacks' }
WAWebSocket >> onError: aOneArgumentBlock [

	onError := aOneArgumentBlock
	
]

{ #category : 'callbacks' }
WAWebSocket >> onMessage: aOneArgumentBlock [

	onMessage := aOneArgumentBlock
]

{ #category : 'running' }
WAWebSocket >> run [
	"Run the WebSocket's input process."

	self subclassResponsibility
]

{ #category : 'callbacks' }
WAWebSocket >> send: aString [
	"Write data to the socket"

	self subclassResponsibility
]

{ #category : 'accessing' }
WAWebSocket >> session [

	^ session
]

{ #category : 'private' }
WAWebSocket >> touchSession [
	"Prevent session expiry."

	session ifNotNil: [ :s | 
		s application cache at: s key ifAbsent: [ ] ]
]
