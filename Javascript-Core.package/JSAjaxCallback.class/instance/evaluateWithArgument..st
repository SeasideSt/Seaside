evaluation
evaluateWithArgument: anObject
	block isNil
		ifFalse: [ block valueWithPossibleArguments: (Array with: anObject) ].
	self requestContext
		respond: [ :response | response doNotCache ]