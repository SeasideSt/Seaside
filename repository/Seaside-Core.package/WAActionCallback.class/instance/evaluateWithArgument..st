evaluation
evaluateWithArgument: anObject
	block valueWithPossibleArguments: (Array with: anObject).
	self signalRenderNotification