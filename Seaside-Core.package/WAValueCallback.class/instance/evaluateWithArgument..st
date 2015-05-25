evaluation
evaluateWithArgument: anObject
	anObject isNil
		ifFalse: [ block valueWithPossibleArguments: (Array with: anObject) ]