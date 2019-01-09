initialization
initializeWithException: anException continuation: aContinuation

	self initializeWithException: anException.
	continuation := aContinuation.
	self applicationDeployed
		ifTrue: [ self addContinuation ].