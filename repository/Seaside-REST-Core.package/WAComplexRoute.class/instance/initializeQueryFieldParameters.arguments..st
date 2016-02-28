initialization
initializeQueryFieldParameters: queryFields arguments: aCollectionOfStrings
	queryFields
		keysAndValuesDo: [ :key :value | parameterMatches at: key put: (WAParameterMatch name: key value: value arguments: aCollectionOfStrings) ]