description
describeOn: config
	(config list: #exceptionHandler)
		options: [ self exceptionHandlerClasses ];
		default: WAErrorHandler