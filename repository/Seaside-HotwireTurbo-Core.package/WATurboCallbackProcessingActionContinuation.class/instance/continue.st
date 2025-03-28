processing
continue

	| renderContinuation |
	(self requestContext request isTurboFrameRequest or: [ self requestContext request isTurboStreamRequest ])
		ifTrue: [
			"TODO: perhaps it's better to have a different rendercontinuation class for rendering a turboframe vs rendering a turbostream"
			renderContinuation := self createTurboRenderContinuation.
			renderContinuation captureState.
			self redirectToContinuation: renderContinuation.
			^ self ]
		ifFalse: [ super continue ]