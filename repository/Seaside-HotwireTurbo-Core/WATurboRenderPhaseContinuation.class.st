Class {
	#name : 'WATurboRenderPhaseContinuation',
	#superclass : 'WARenderPhaseContinuation',
	#instVars : [
		'renderContext',
		'turboStreamCallback'
	],
	#category : 'Seaside-HotwireTurbo-Core',
	#package : 'Seaside-HotwireTurbo-Core'
}

{ #category : 'accessing' }
WATurboRenderPhaseContinuation >> prepareWithRenderContext: aContext [

	renderContext := aContext.
	turboStreamCallback := renderContext callbacks findTurboStreamCallbackIn: self requestContext request

]

{ #category : 'processing' }
WATurboRenderPhaseContinuation >> processRendering: aResponse [

	(self requestContext request isTurboFrameRequest or: [ 
		 self requestContext request isTurboStreamRequest ])
		ifTrue: [ 
			turboStreamCallback
				ifNil: [ self requestContext request isTurboFrameRequest 
					ifTrue: [ self processTurboFrameRendering: aResponse ]
					ifFalse: [ super processRendering: aResponse ] ]
				ifNotNil: [ self processTurboStreamRendering: aResponse ] ]
		ifFalse: [ super processRendering: aResponse ]
]

{ #category : 'rendering' }
WATurboRenderPhaseContinuation >> processTurboFrameRendering: aResponse [
	
	| document turboframeId |
	aResponse
		doNotCache;
		contentType: self application contentType.
	turboframeId := self requestContext request headerAt: 'turbo-frame'.
	document := (WAHtmlDocument on: aResponse stream codec: self requestContext codec)
		scriptGenerator: self requestContext handler scriptGeneratorClass new;
		yourself.
	renderContext 
		document: document 
		during: [
			renderContext 
				visitor: ((WATurboFramePresenterGuide client: (WARenderVisitor context: renderContext)) id: turboframeId) 
				during: [
					self presenter renderWithContext: renderContext ] ].
	document scriptGenerator closeOn: document
]

{ #category : 'processing' }
WATurboRenderPhaseContinuation >> processTurboStreamRendering: aResponse [

	aResponse
		doNotCache;
		contentType: 'text/vnd.turbo-stream.html'.
	turboStreamCallback renderTurboStreamOn: aResponse stream
]

{ #category : 'updating' }
WATurboRenderPhaseContinuation >> updateRoot: aRoot [

	super updateRoot: aRoot.
	"In the Seaside heretic framework, callbacks modify state. So do not prefetch them!"
	aRoot meta turboPrefetch: 'false'.
	"TODO: how to avoid the meta header to be removed when a single frame is replaced? Then we do not need the bodyAttribute anymore..."
	aRoot bodyAttributes at: 'data-turbo-prefetch' put: 'false'.
	aRoot javascript
		type: 'module';
		url: WATurboFileLibrary / #turboes2017esmminJs 
]
