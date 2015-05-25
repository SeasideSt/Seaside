tests
testPassword
	url
		host: 'seaside.st';
		user: 'foo';
		password: 'bar'.
	self assert: url password = 'bar'.
	self assert: url greaseString = 'http://foo:bar@seaside.st/'