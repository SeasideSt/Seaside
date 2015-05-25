tests
testBasicAuthorisation
	| request headers |
	request := WARequest method: 'GET' uri: '/foo?bar=1'.
	headers := Dictionary new.
	headers at: 'authorization' put: 'Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=='.
	request setHeaders: headers.
	
	self assert: request authorization = 'Aladdin:open sesame'.
	self assert: request user = 'Aladdin'.
	self assert: request password = 'open sesame'