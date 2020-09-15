tests
testForwardedFor
	| request headers |
	request := WARequest method: 'GET' uri: '/foo?bar=1'.
	headers := Dictionary new.
	request setHeaders: headers.
	
	headers at: 'forwarded' put: 'For="[2001:db8:cafe::17]:4711"'.
	self assert: request forwardedFor equals: '"[2001:db8:cafe::17]:4711"'.
	headers at: 'forwarded' put: 'for=192.0.2.60;proto=http;by=203.0.113.43'.
	self assert: request forwardedFor equals: '192.0.2.60'.
	headers at: 'forwarded' put: 'for=192.0.2.43, for=198.51.100.17'.
	self assert: request forwardedFor equals: '192.0.2.43'