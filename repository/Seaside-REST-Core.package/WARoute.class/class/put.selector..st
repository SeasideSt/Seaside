instance creation
put: aString selector: aSymbol
	^ WAComplexRoute
		method: 'PUT'
		selector: aSymbol
		pattern: aString