instance creation
delete: aString selector: aSymbol
	^ WAComplexRoute
		method: 'DELETE'
		selector: aSymbol
		pattern: aString