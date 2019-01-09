testing
testSignalError
	cache := WAHashCache
		initialSize: 13
		maximumSize: 10
		maximumAbsoluteAge: 0
		maximumRelativeAge: 0
		overflowAction: WAHashCache signalError.
		
	1 to: 10 do: [ :i |
		cache at: i put: i greaseString ].
	
	self should: [ cache at: 11 put: '11' ] raise: WAMaximumNumberOfSessionsExceededError