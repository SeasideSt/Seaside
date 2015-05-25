request processing
validate: anObject
	^ [ validationBlock value: anObject.
	message contents: nil.
	true ]
		on: self exceptionClass
		do: [ :exception |
			message contents: exception messageText.
			exception return: false ]