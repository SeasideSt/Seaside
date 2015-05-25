tests
testTakeServerParametersFromRequestHttps
	| request |
	request := WARequest new
		setHeaders: (Dictionary new
				at: 'host' put: 'www.seaside.st';
				at: 'base' put: 'foo/bar';
				yourself);
		yourself.
	url takeServerParametersFromRequest: request.
	self assert: url greaseString = 'http://www.seaside.st/foo/bar'