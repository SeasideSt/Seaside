testing
dateIsValid
	[ self date ] on: Error do: [ :e | ^ false ].
	^ true