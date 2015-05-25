testing
timeIsValid
	[ self time ] on: Error do: [ :e | ^ false ].
	^ true