accessing
initialize
	| application |
	application := WAAdmin register: self asApplicationAt: 'examples/websockets/slider'.
	application 
		addLibrary: JQDevelopmentLibrary;
		addLibrary: JQUiDevelopmentLibrary;
		addLibrary: JQSmoothnessTheme