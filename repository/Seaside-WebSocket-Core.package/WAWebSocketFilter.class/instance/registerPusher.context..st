public
registerPusher: aPusher context: aContext
	pushers at: aPusher id put: aPusher.
	^ aPusher id