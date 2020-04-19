public
addKey: aString toUrl: aUrl
	^ (self strategyFor: self requestContext)
		addKey: aString toUrl: aUrl