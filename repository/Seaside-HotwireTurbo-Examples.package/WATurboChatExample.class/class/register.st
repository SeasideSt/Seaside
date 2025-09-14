initialization
register

	(WAAdmin register: self asApplicationAt: '/examples/hotwired/chat')
		preferenceAt: #actionPhaseContinuationClass put: WATurboCallbackProcessingActionContinuation;
		preferenceAt: #renderPhaseContinuationClass put: WATurboRenderPhaseContinuation