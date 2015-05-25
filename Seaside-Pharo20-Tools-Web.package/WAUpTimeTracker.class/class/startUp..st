initialization
startUp: resuming
	resuming ifFalse: [
		"don't reset in case of just saving the image"
		^ self ].
	self default reset