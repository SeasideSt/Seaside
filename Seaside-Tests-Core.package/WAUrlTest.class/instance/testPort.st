tests
testPort
	url
		host: 'seaside.st';
		port: 8080.
	self assert: url port = 8080.
	self assert: url greaseString = 'http://seaside.st:8080/'