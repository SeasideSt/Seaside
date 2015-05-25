instance creation
get: aString selector: aSymbol
	^ WAComplexRoute
		method: 'GET'
		selector: aSymbol
		pattern: aString