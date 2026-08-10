testing
matchesParameters: aDictionary

	optionalQueryParameters isNil 
		ifTrue:[ aDictionary isEmpty ifFalse: [ ^ false ]]
		ifFalse:[ (aDictionary keys allSatisfy: [ :k | optionalQueryParameters includes: k ]) ifFalse: [ ^ false ] ].
	^ true
