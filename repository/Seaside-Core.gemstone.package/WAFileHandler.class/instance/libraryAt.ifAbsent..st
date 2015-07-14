accessing
libraryAt: aSymbol ifAbsent: aBlock
	^ self libraries 
		detect: [ :each | each handlesFolder: aSymbol ]
		ifNone: aBlock