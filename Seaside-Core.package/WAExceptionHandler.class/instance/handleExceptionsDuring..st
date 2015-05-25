actions
handleExceptionsDuring: aBlock
	^ aBlock
		on: self
		do: [ :exception | 
			[ self handleException: exception ]
				"If there's an error while handling the exception, fall
				back on an internal error response."
				on: Error
				do: [ :error | self internalError: error ] ] 