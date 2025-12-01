"
I create new instances of WebSocket. I abstract away the server specific ways to create new WebSockets.
"
Class {
	#name : 'WAWebSocketCreator',
	#superclass : 'WAObject',
	#category : 'Seaside-WebSocket-Core',
	#package : 'Seaside-WebSocket-Core'
}

{ #category : 'instance creation' }
WAWebSocketCreator >> newWebSocketInRequestContext: aRequestContext [
	^ self socketClass basicNew initializeWithRequestContext: aRequestContext
]

{ #category : 'instance creation' }
WAWebSocketCreator >> socketClass [
	self subclassResponsibility
]
