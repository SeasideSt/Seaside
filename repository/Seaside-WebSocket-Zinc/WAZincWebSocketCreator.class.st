Class {
	#name : 'WAZincWebSocketCreator',
	#superclass : 'WAWebSocketCreator',
	#category : 'Seaside-WebSocket-Zinc',
	#package : 'Seaside-WebSocket-Zinc'
}

{ #category : 'instance creation' }
WAZincWebSocketCreator >> socketClass [
	^ WAZincWebSocket
]
