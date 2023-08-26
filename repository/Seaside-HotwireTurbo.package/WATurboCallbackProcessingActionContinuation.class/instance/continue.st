actions
continue

	| renderContinuation |
	self requestContext request isTurboFrameRequest
		ifTrue: [ 
			renderContinuation := self createTurboRenderContinuation.
			self redirectToContinuation: renderContinuation.
			^ self ]
		ifFalse: [ super continue ]