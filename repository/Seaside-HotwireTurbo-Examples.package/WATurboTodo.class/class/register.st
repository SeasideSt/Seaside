initialization
register

	(WAAdmin register: self asApplicationAt: '/examples/hotwired/todo')
		exceptionHandler: WADebugErrorHandler;
		addLibrary: WAExamplesLibrary;
		preferenceAt: #actionPhaseContinuationClass put: WATurboCallbackProcessingActionContinuation;
		preferenceAt: #renderPhaseContinuationClass put: WATurboRenderPhaseContinuation