public
mapArgumentsWithElements: anArrayOfStrings parameters: aDictionary into: anArray
	| offset |
	offset := 0.
	pathMatches do: [ :each |
		each matchesJustOneElement ifFalse: [
			offset := anArrayOfStrings size - pathMatches size ].
		each mapArgumentsWithElements: anArrayOfStrings into: anArray usingOffset: offset ].
	parameterMatches do: [ :each |
		each mapArgumentsWithParameters: aDictionary into: anArray ]