instance creation
options: aString selector: aSymbol
	^ WAComplexRoute
		method: 'OPTIONS'
		selector: aSymbol
		pattern: aString