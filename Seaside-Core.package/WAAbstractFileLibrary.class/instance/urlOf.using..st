accessing
urlOf: aSymbol using: aHandler
	^ aHandler baseUrlForLibrary
		addToPath: self className;
		addToPath: (self asFilename: aSymbol);
		yourself