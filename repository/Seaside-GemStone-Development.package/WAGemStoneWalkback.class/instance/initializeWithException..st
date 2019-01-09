initialization
initializeWithException: anException
	super initializeWithException: anException.
	self initializeWithContext: self currentContextForWalkback.