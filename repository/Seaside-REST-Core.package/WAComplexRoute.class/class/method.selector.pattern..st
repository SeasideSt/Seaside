instance creation
method: aMethodString selector: aSymbol pattern: aPatternString
	^ self
		method: aMethodString
		selector: aSymbol
		url: (WAUrl absolute: aPatternString)
		arguments: #()
		produces: WAWildcardMimeTypeMatch new
		consumes: WAWildcardMimeTypeMatch new