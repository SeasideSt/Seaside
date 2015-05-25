processing
continue
	| renderContinuation |
	renderContinuation := self createRenderContinuation.
	renderContinuation captureState.
	self shouldRedirect
		ifTrue: [ self redirectToContinuation: renderContinuation ]
		ifFalse: [ renderContinuation handle: self requestContext ]