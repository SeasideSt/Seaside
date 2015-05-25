tests
testTakeServerParametersFromRequest
	| request |
	request := WARequest new
		setHeaders: (Dictionary new
			at: 'host' put: 'www.seaside.st:8080';
			yourself);
		yourself.
	url takeServerParametersFromRequest: request.
	self assert: url printString = 'http://www.seaside.st:8080/'