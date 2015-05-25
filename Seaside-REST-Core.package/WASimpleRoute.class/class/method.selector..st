instance creation
method: aString selector: aSymbol
	^ self
		method: aString
		selector: aSymbol
		produces: WAWildcardMimeTypeMatch new
		consumes: WAWildcardMimeTypeMatch new