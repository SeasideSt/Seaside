public
keyFromContext: aRequestContext
	^ (self strategyFor: aRequestContext)
		keyFromContext: aRequestContext