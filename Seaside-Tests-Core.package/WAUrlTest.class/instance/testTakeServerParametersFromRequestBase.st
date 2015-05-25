tests
testTakeServerParametersFromRequestBase
	| request |
	request := (WARequest 
		method: 'GET'
		uri: (WAUrl new
				scheme: 'https';
				yourself))
		setHeaders: (Dictionary new
				at: 'host' put: 'www.thehost.com:1337';
				yourself);
		yourself.
	url takeServerParametersFromRequest: request.
	self assert: url greaseString = 'https://www.thehost.com:1337/'