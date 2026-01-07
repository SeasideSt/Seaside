Class {
	#name : 'WAWebSocketJSPusher',
	#superclass : 'WAWebSocketPusher',
	#category : 'Seaside-WebSocket-Core',
	#package : 'Seaside-WebSocket-Core'
}

{ #category : 'public' }
WAWebSocketJSPusher >> javascript: aBlock [

	"Evaluate aBlock with an JSScript instance and pushes the resulting script-string aString to all associated websockets."

	| script |
	script := (JSScript context: self renderContext)
		          rendererClass: self rendererClass;
		          yourself.
	aBlock value: script.
	self push: (String streamContents: [ :stream | stream javascript: script ])
]

{ #category : 'protected' }
WAWebSocketJSPusher >> websocketEventHandlerJavaScriptOn: aRenderer [
	aRenderer 
		javascript: '.addEventListener(''message'', (event) => { Function(`"use strict";return (${event.data})`)(); })'
]
