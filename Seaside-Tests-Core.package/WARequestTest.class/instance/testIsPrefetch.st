tests
testIsPrefetch
	| request headers |
	request := WARequest method: 'GET' uri: '/foo'.
	self deny: request isPrefetch.
	
	headers := Dictionary new.
	headers at: 'x-moz' put: 'prefetch'.
	request setHeaders: headers.
	self assert: request isPrefetch