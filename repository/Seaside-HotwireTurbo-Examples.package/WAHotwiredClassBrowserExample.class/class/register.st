testing
register

	| app |
	app := WAAdmin register: self asApplicationAt: 'developer'.
	app
		preferenceAt: #actionPhaseContinuationClass put: WATurboCallbackProcessingActionContinuation;
		preferenceAt: #renderPhaseContinuationClass put: WATurboRenderPhaseContinuation;
		preferenceAt: #sessionClass put: WAHotwireClassBrowserSession;
		addLibrary: WAHotwiredClassBrowserFileLibrary;
		addLibrary: JQDeploymentLibrary 