tests
test10
	| request |
	request := WARequest method: 'GET' uri: '/' version: WAHttpVersion http10.
	
	self assert: request isGet.
	self assert: request isHttp10.
	self deny: request isSsl