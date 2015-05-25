initialization
initialize
	| application |
	application := WAAdmin register: self asApplicationAt: 'comet/report'.
	application
		addLibrary: JQDevelopmentLibrary;
		addLibrary: CTLibrary