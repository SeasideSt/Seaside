convenience
resetIfPossible
	^ self isCommitted not and: [
		"Reset only if not committed.
		Stream does not have to be reset because it isn't committed yet.
		(it couldn't be reset anyway because it's a SocketStream)"
		super resetIfPossible  ]