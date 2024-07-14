private
createTurboRenderContinuation

	| renderContinuation |
	renderContinuation := WATurboRenderPhaseContinuation new.
	renderContinuation prepareWithRenderContext: renderContext. 
	^ renderContinuation