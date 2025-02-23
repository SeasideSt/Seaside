initialization
register

	(WAAdmin register: self asApplicationAt: '/examples/turbo/multicounter')
		addLibrary: JQDevelopmentLibrary;
		preferenceAt: #actionPhaseContinuationClass put: WATurboCallbackProcessingActionContinuation;
		preferenceAt: #renderPhaseContinuationClass put: WATurboRenderPhaseContinuation