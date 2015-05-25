testing
matchesParameters: aDictionary
	parameterMatches size = aDictionary size
		ifFalse: [ ^ false ].
	parameterMatches keysAndValuesDo: [ :name :match |
		| value |
		value := aDictionary at: name ifAbsent: [ ^ false ].
		(match matchesName: name value: value)
			ifFalse: [ ^ false ] ].
	^ true