accessing
exceptionFilter
	^ self application filters detect: [ :each | each isExceptionFilter ] ifNone: [ nil ]