initialization
initialize
	 (WAAdmin register: self asApplicationAt: '/examples/todo-jquery')
		exceptionHandler: WADebugErrorHandler;
		addLibrary: WAExamplesLibrary