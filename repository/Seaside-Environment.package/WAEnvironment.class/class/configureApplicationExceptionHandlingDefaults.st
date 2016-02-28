class initialization
configureApplicationExceptionHandlingDefaults
	(configuredExceptionHandlingDefaults ifNil: [ false ]) ifFalse: [
		WAAdmin applicationExceptionHandlingDefaults
			at: #exceptionHandler put: WAWalkbackErrorHandler.
		configuredExceptionHandlingDefaults := true ]
	