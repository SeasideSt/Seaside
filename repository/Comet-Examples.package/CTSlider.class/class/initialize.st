initialization
initialize
	| application |
	application := WAAdmin register: self asApplicationAt: 'comet/slider'.
	application 
		addLibrary: JQDevelopmentLibrary;
		addLibrary: JQUiDevelopmentLibrary;
		addLibrary: JQSmoothnessTheme;
		addLibrary: CTLibrary