accessing
exceptionClass
	^ exceptionClass ifNil: [ exceptionClass := WAValidationNotification ]