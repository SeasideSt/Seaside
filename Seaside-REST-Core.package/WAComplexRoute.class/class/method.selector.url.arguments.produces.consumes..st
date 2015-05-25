instance creation
method: aString selector: aSymbol url: aUrl arguments: aCollectionOfStrings produces: aProducesMimeTypeMatch consumes: aConsumesMimeTypeMatch
	^ self basicNew
		initializeWithMethod: aString
		selector: aSymbol
		url: aUrl
		arguments: aCollectionOfStrings
		produces: aProducesMimeTypeMatch
		consumes: aConsumesMimeTypeMatch 