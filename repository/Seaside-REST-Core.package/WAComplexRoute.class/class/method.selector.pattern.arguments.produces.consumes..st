instance creation
method: aMethodString selector: aSymbol pattern: aPatternString arguments: aCollectionOfStrings produces: aProducesMimeTypeMatch consumes: aConsumesMimeTypeMatch 
	^ self
		method: aMethodString
		selector: aSymbol
		url: (WAUrl absolute: aPatternString)
		arguments: aCollectionOfStrings
		produces: aProducesMimeTypeMatch
		consumes: aConsumesMimeTypeMatch