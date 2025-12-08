Class {
	#name : 'WAWebSocketPusher',
	#superclass : 'WAObject',
	#instVars : [
		'mutex',
		'rendererClass',
		'sockets',
		'id'
	],
	#classInstVars : [
		'process'
	],
	#category : 'Seaside-WebSocket-Core',
	#package : 'Seaside-WebSocket-Core'
}

{ #category : 'accessing' }
WAWebSocketPusher >> addSocket: aWebSocket [

	mutex critical: [ sockets add: aWebSocket ]
]

{ #category : 'accessing' }
WAWebSocketPusher >> id [

	^ id
]

{ #category : 'initialization' }
WAWebSocketPusher >> initialize [

	super initialize.
	mutex := GRPlatform current semaphoreClass forMutualExclusion.
	sockets := OrderedCollection new.
	id := WAKeyGenerator current keyOfLength: 16
]

{ #category : 'accessing' }
WAWebSocketPusher >> mutex [
	"Answer the mutex in use with the receiver."

	^ mutex
]

{ #category : 'protected' }
WAWebSocketPusher >> push: aString [
	"Push aString to all associated handlers."

	self socketsDo:[ :socket |
		socket isConnected ifTrue:[ socket send: aString ] ]
]

{ #category : 'accessing-rendering' }
WAWebSocketPusher >> renderContext [
	"Answer a fake rendering context for this pusher."

	^ WARenderContext new
		document: (WAHtmlDocument on: (WriteStream on: String new));
		actionUrl: WAUrl new;
		yourself
]

{ #category : 'accessing-rendering' }
WAWebSocketPusher >> rendererClass [
	"Answer the default renderer for this pusher."

	^ rendererClass ifNil: [ WARenderer default ]
]

{ #category : 'accessing-rendering' }
WAWebSocketPusher >> rendererClass: aRendererClass [
	rendererClass := aRendererClass
]

{ #category : 'protected' }
WAWebSocketPusher >> socketsDo: aOneArgumentBlock [

	self mutex critical: [
		sockets do: aOneArgumentBlock ]
]
