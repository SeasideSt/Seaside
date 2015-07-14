description
exceptionHandlerClasses
	^ WAExceptionHandler withAllSubclasses asSortedCollection: [ :a :b | a name <= b name ]