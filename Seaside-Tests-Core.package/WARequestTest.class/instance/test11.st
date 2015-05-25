tests
test11
	| request |
	request := WARequest method: 'GET' uri: '/' version: WAHttpVersion http11.
	
	self assert: request isGet.
	self assert: request isHttp11.
	self deny: request isSsl