testing
errorWalkbacksEnabled
	^ (WAAdmin applicationExceptionHandlingDefaults at: #exceptionHandler) = WAWalkbackErrorHandler