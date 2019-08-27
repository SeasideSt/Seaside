tests
testForwarded
	| request headers |
	request := WARequest method: 'GET' uri: '/foo?bar=1'.
	headers := Dictionary new.
	headers at: 'forwarded' put: 'For="[2001:db8:cafe::17]:4711"'.
	request setHeaders: headers.
	
	self assert: request forwarded = 'For="[2001:db8:cafe::17]:4711"'