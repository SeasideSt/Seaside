actions
continue

	| renderContinuation |
	(self requestContext request isTurboFrameRequest or: [ self requestContext request isTurboStreamRequest ])
		ifTrue: [ 
			renderContinuation := self createTurboRenderContinuation.
			self redirectToContinuation: renderContinuation.
			^ self ]
		ifFalse: [ super continue ]