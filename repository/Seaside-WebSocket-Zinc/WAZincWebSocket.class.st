Class {
	#name : 'WAZincWebSocket',
	#superclass : 'WAWebSocket',
	#instVars : [
		'znWebSocket'
	],
	#category : 'Seaside-WebSocket-Zinc',
	#package : 'Seaside-WebSocket-Zinc'
}

{ #category : 'instance creation' }
WAZincWebSocket class >> on: aWebSocket [
	^ self basicNew
		initializeWith: aWebSocket;
		yourself
]

{ #category : 'initialization' }
WAZincWebSocket >> initializeWith: aZnWebSocket [

	self initialize.
	znWebSocket := aZnWebSocket
]

{ #category : 'testing' }
WAZincWebSocket >> isConnected [

	^ znWebSocket isConnected
]

{ #category : 'running' }
WAZincWebSocket >> run [

	[ znWebSocket runWith: [ :message | self touchSession. onMessage value: message ] ]
		on: ConnectionClosed
		do: [ :e | onClose ifNotNil: [ onClose cull: e ] ]
]

{ #category : 'callbacks' }
WAZincWebSocket >> send: aString [

	self isConnected ifFalse: [ ^ self ].
	self touchSession.
	znWebSocket sendMessage: aString
]

{ #category : 'initialization' }
WAZincWebSocket >> znWebSocket: aZnWebSocket [

	znWebSocket := aZnWebSocket.
	self run
]
