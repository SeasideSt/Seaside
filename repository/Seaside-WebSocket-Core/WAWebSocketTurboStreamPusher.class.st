Class {
	#name : 'WAWebSocketTurboStreamPusher',
	#superclass : 'WAWebSocketPusher',
	#category : 'Seaside-WebSocket-Core',
	#package : 'Seaside-WebSocket-Core'
}

{ #category : 'accessing' }
WAWebSocketTurboStreamPusher >> codec [

	^ self requestContext codec
]

{ #category : 'accessing' }
WAWebSocketTurboStreamPusher >> scriptGeneratorClass [

 ^ self requestContext handler scriptGeneratorClass
]

{ #category : 'public' }
WAWebSocketTurboStreamPusher >> turboStream: aBlock [
	"Evaluate aBlock with an WATurboStreamBuilder and push the resulting turbostream element to all associated websockets."

	| renderContext turboStreamElement |
	turboStreamElement := (String streamContents: [ :stream |
			 | document |
			 document := (WAHtmlDocument
				              on: stream
				              codec: self codec)
				             scriptGenerator: self scriptGeneratorClass new;
				             yourself.
			 renderContext := self renderContext.
			 self rendererClass configureRenderContext: renderContext.
			 renderContext document: document during: [
				self withRenderingDynamicVariables: [
				 aBlock value: (WATurboStreamBuilder newWithRenderContext: renderContext) ] ] ]).
	self push: turboStreamElement
]

{ #category : 'private' }
WAWebSocketTurboStreamPusher >> withRenderingDynamicVariables: aBlock [

	aBlock value
]
