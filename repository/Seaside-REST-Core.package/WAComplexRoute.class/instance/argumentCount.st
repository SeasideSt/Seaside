accessing
argumentCount
	| count |
	count := 0.
	pathMatches do: [ :each |
		count := count + each argumentCount ].
	parameterMatches do: [ :each |
		count := count + each argumentCount ].
	^ count