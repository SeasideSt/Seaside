initialization
register

	(WAAdmin register: self asApplicationAt: '/examples/turbo/todo')
		exceptionHandler: WADebugErrorHandler;
		addLibrary: WAExamplesLibrary;
		preferenceAt: #actionPhaseContinuationClass put: WATurboCallbackProcessingActionContinuation;
		preferenceAt: #renderPhaseContinuationClass put: WATurboRenderPhaseContinuation