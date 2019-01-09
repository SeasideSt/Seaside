initialization
initialize
	(WAAdmin register: self asApplicationAt: '/examples/todo')
		exceptionHandler: WADebugErrorHandler;
		addLibrary: WAExamplesLibrary