Class {
	#name : 'WATurboStreamCallback',
	#superclass : 'WAActionCallback',
	#instVars : [
		'renderContext'
	],
	#category : 'Seaside-HotwireTurbo-Core',
	#package : 'Seaside-HotwireTurbo-Core'
}

{ #category : 'accessing' }
WATurboStreamCallback >> context: aContext [

	renderContext := aContext
]

{ #category : 'testing' }
WATurboStreamCallback >> isEnabledFor: aRequestContext [

	^ false
]

{ #category : 'testing' }
WATurboStreamCallback >> isTurboStreamCallback [

	^ true
]

{ #category : 'accessing' }
WATurboStreamCallback >> priority [

	^ 15
]

{ #category : 'evaluation' }
WATurboStreamCallback >> renderTurboStreamOn: aStream [
	
	| document |
	document := (WAHtmlDocument
		on: aStream
		codec: self requestContext codec)
		scriptGenerator: self requestContext handler scriptGeneratorClass new;
		yourself.
	renderContext document: document during: [ 
		block value: (WATurboStreamBuilder newWithRenderContext: renderContext) ]
]
