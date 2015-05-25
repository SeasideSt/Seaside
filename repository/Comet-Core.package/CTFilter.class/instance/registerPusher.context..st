public
registerPusher: aPusher context: aContext
	| handler |
	handler := CTHandler on: aPusher.
	handlers at: handler id put: handler.
	^ handler id