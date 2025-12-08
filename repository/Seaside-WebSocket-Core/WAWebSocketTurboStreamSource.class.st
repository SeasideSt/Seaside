Class {
	#name : 'WAWebSocketTurboStreamSource',
	#superclass : 'WAPainter',
	#instVars : [
		'pusher'
	],
	#category : 'Seaside-WebSocket-Core',
	#package : 'Seaside-WebSocket-Core'
}

{ #category : 'configuration' }
WAWebSocketTurboStreamSource class >> headerField [
	^ '_ws'
]

{ #category : 'accessing' }
WAWebSocketTurboStreamSource >> filter [
	^ self session filters
		detect: [ :each | each isWebSocketFilter ]
		ifNone: [ self session addFilterFirst: WAWebSocketFilter new ]
]

{ #category : 'accessing' }
WAWebSocketTurboStreamSource >> pusher [

	^ pusher
]

{ #category : 'accessing' }
WAWebSocketTurboStreamSource >> pusher: aPusher [
	pusher := aPusher
]

{ #category : 'rendering' }
WAWebSocketTurboStreamSource >> renderContentOn: html [

	| pusherId actionUrl |
	pusherId := self filter registerPusher: self pusher context: self requestContext.
	actionUrl := html context actionUrl
		       withField: WAWebSocket headerField
		       value: pusherId.

	(html tag: 'turbo-stream-source')
		attributeAt: 'src' put: 'ws://localhost:8080', actionUrl asString
]
