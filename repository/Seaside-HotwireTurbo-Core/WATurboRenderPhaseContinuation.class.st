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
				ifNil: [ self processTurboFrameRendering: aResponse ]
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
					self presenter renderWithContext: renderContext ]
					"self presenter allPresentersDo: [ :p | ((p isKindOf: WATurboFrame) and: [ turboframeId = p id ]) ifTrue:[ self halt. p renderWithContext: renderContext ] ]" ].
	document scriptGenerator closeOn: document
]

{ #category : 'processing' }
WATurboRenderPhaseContinuation >> processTurboStreamRendering: aResponse [

	aResponse
		doNotCache;
		contentType: 'text/vnd.turbo-stream.html'.
	turboStreamCallback renderTurboStreamOn: aResponse stream
]
