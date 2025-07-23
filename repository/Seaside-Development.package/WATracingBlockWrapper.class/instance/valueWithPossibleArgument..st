evaluating
valueWithPossibleArgument: anArg
	self halt.
	self trace.
	^ block valueWithPossibleArgument: anArg