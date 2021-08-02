instance creation
head: aString selector: aSymbol
	^ WAComplexRoute
		method: 'HEAD'
		selector: aSymbol
		pattern: aString