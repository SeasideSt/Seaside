testing
matchesParameters: aDictionary

	optionalQueryParameters ifNil:[ 
		parameterMatches size = aDictionary size
			ifFalse: [ ^ false ] ].
	parameterMatches keysAndValuesDo: [ :name :match |
		| value |
		value := aDictionary at: name ifAbsent: [ ^ false ].
		(match matchesName: name value: value)
			ifFalse: [ ^ false ] ].
	optionalQueryParameters ifNotNil:[
		| allPossibleParameters |
		allPossibleParameters := parameterMatches keys, optionalQueryParameters.
		(aDictionary keys allSatisfy: [ :k | allPossibleParameters includes: k ]) ifFalse: [ ^ false ] ].

	^ true