public
noHandlerFoundForKey: aString in: anApplication context: aRequestContext
	^ (self strategyFor: aRequestContext)
		noHandlerFoundForKey: aString in: anApplication context: aRequestContext