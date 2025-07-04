testing
register
	"test"
	| app |
	app := WAAdmin register: self asApplicationAt: '/examples/turbo/classbrowser'.
	app
		preferenceAt: #actionPhaseContinuationClass put: WATurboCallbackProcessingActionContinuation;
		preferenceAt: #renderPhaseContinuationClass put: WATurboRenderPhaseContinuation;
		preferenceAt: #sessionClass put: WAHotwireClassBrowserSession;
		addLibrary: WAHotwiredClassBrowserFileLibrary;
		addLibrary: JQDeploymentLibrary 