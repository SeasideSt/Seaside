evaluation
evaluateWithArgument: anObject
	values at: anObject greaseInteger ifPresent: [ :value | block valueWithPossibleArguments: (Array with: value) ]