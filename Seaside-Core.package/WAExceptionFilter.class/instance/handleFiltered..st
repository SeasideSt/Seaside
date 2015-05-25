processing
handleFiltered: aRequestContext
	| handler |
	handler := self exceptionHandler context: aRequestContext.
	handler handleExceptionsDuring: [
		WACurrentExceptionHandler
			use: handler
			during: [ super handleFiltered: aRequestContext ] ]
		