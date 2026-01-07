Class {
	#name : 'ZnSeasideWebSocketDelegate',
	#superclass : 'ZnWebSocketDelegate',
	#category : 'Seaside-WebSocket-Zinc',
	#package : 'Seaside-WebSocket-Zinc'
}

{ #category : 'protocol' }
ZnSeasideWebSocketDelegate >> webSocketResponseForRequest: request [
	"Given a valid WebSocket setup request, return the matching server response"
	
	| acceptKey |
	acceptKey := ZnWebSocketUtils handshake: (request headers at: 'sec-websocket-key').
	^ ZnWebSocketResponse new
		statusLine: (ZnStatusLine code: 101);
		headers: (self responseHeadersForKey: acceptKey);
		continuation: self continuation;
		yourself
]
