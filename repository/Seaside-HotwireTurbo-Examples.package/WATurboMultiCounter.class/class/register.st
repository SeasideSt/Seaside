initialization
register

	(WAAdmin register: self asApplicationAt: '/examples/hotwired/multicounter')
		addLibrary: JQDevelopmentLibrary;
		preferenceAt: #actionPhaseContinuationClass put: WATurboCallbackProcessingActionContinuation;
		preferenceAt: #renderPhaseContinuationClass put: WATurboRenderPhaseContinuation