tests
testUser
	url
		host: 'seaside.st';
		user: 'foo'.
	self assert: url user = 'foo'.
	self assert: url greaseString = 'http://foo@seaside.st/'