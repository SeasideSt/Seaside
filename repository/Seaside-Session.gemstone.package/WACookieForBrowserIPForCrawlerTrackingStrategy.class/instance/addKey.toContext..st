public
addKey: aString toContext: aRequestContext
	^ (self strategyFor: aRequestContext)
		addKey: aString toContext: aRequestContext