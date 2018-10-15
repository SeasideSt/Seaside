instance creation
patch: aString selector: aSymbol
	^ WAComplexRoute
		method: 'PATCH'
		selector: aSymbol
		pattern: aString