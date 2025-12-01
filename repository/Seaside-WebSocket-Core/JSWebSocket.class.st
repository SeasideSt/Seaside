Class {
	#name : 'JSWebSocket',
	#superclass : 'JSObject',
	#instVars : [
		'pusher',
		'url'
	],
	#category : 'Seaside-WebSocket-Core',
	#package : 'Seaside-WebSocket-Core'
}

{ #category : 'initialize-release' }
JSWebSocket >> close [
	self call: 'close'
]

{ #category : 'printing' }
JSWebSocket >> defaultUrl [
	^ self renderContext actionUrl
		addField: WAWebSocket headerField
		value: self pusher id
]

{ #category : 'accessing' }
JSWebSocket >> filter [
	^ self session filters
		detect: [ :each | each isWebSocketFilter ]
		ifNone: [ self session addFilterFirst: WAWebSocketFilter new ]
]

{ #category : 'printing' }
JSWebSocket >> javascriptContentOn: aStream [
	"TODO: window.location should not be retrieved here..."
	aStream
		nextPutAll: 'new WebSocket(((window.location.protocol === "https:") ? "wss://" : "ws://") + window.location.host + ';
		javascript: self url;
		nextPut: $).
	pusher ifNotNil:[ pusher websocketEventHandlerJavaScriptOn: aStream ]
]

{ #category : 'accessing' }
JSWebSocket >> pusher [
	^ pusher
]

{ #category : 'accessing' }
JSWebSocket >> pusher: aPusher [
	pusher := aPusher.
	
	self url: (self renderContext actionUrl
		withField: WAWebSocket headerField
		value: (self filter
			registerPusher: pusher
			context: self requestContext))
]

{ #category : 'initialize-release' }
JSWebSocket >> send: anObject [
	self call: 'send' with: anObject
]

{ #category : 'printing' }
JSWebSocket >> url [
	^ url ifNil: [ url := self defaultUrl ]
]

{ #category : 'accessing' }
JSWebSocket >> url: aUrl [
	url := aUrl
]
