Class {
	#name : 'WATurboCallbackProcessingActionContinuation',
	#superclass : 'WACallbackProcessingActionContinuation',
	#category : 'Seaside-HotwireTurbo-Core',
	#package : 'Seaside-HotwireTurbo-Core'
}

{ #category : 'processing' }
WATurboCallbackProcessingActionContinuation >> continue [

	| renderContinuation |
	(self requestContext request isTurboFrameRequest or: [ self requestContext request isTurboStreamRequest ])
		ifTrue: [
			"TODO: perhaps it's better to have a different rendercontinuation class for rendering a turboframe vs rendering a turbostream"
			renderContinuation := self createTurboRenderContinuation.
			self redirectToContinuation: renderContinuation.
			^ self ]
		ifFalse: [ super continue ]
]

{ #category : 'private' }
WATurboCallbackProcessingActionContinuation >> createTurboRenderContinuation [

	| renderContinuation |
	renderContinuation := WATurboRenderPhaseContinuation new.
	renderContinuation prepareWithRenderContext: renderContext. 
	^ renderContinuation
]
