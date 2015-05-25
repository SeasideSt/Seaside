instance creation
post: aString selector: aSymbol
	^ WAComplexRoute
		method: 'POST'
		selector: aSymbol
		pattern: aString