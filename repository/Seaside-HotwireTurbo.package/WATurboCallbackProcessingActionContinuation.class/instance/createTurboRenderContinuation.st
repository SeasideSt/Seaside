private
createTurboRenderContinuation

	| renderContinuation |
	renderContinuation := WATurboRenderPhaseContinuation new.
	renderContinuation renderContext: renderContext.
	^ renderContinuation