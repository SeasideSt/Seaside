processing
handleAnswer: anObject continueWith: aBlock
	block valueWithPossibleArguments: (Array with:  anObject)