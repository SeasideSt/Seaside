class initialization
initialize

	(WAAdmin register: self asApplicationAt: 'examples/websockets/turbo')
		addLibrary: JQDeploymentLibrary;
		preferenceAt: #actionPhaseContinuationClass put: WATurboCallbackProcessingActionContinuation;
		preferenceAt: #renderPhaseContinuationClass put: WATurboRenderPhaseContinuation