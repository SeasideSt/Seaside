class initialization
initialize
	(WAAdmin register: self asApplicationAt: 'tests/functional-hotwired')
		sessionClass: WAExpirySession;
		preferenceAt: #actionPhaseContinuationClass put: WATurboCallbackProcessingActionContinuation