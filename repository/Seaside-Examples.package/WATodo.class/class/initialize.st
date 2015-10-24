initialization
initialize
	|app|
	app := WAAdmin register: self asApplicationAt: '/examples/todo'.
	app exceptionHandler: WADebugErrorHandler.
	app addLibrary: WAExamplesLibrary.