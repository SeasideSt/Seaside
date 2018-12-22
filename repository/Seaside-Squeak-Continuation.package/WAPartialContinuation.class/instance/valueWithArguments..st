evaluating
valueWithArguments: anArray 
	^ anArray size = 1 
		ifTrue: [ self value: anArray first ]
		ifFalse: 
			[ GRInvalidArgumentCount signal: 'Continuations can only be resumed with one argument.' ]