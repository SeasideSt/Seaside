tests
testIsSsl
	| request |
	request := WARequest
		method: 'GET'
		uri: ('/' seasideUrl
			scheme: 'https';
			yourself)
		version: WAHttpVersion http11.
	
	self assert: request isGet.
	self assert: request isHttp11.
	self assert: request isSsl