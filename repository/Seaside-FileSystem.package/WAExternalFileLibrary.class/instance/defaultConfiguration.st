configuration
defaultConfiguration
	^ super defaultConfiguration
		addParent: WAExternalFileLibraryConfiguration instance;
		yourself