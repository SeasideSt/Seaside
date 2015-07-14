public
addKey: aString toUrl: aUrl
	^ (self strategyFor: WACurrentRequestContext value)
		addKey: aString toUrl: aUrl