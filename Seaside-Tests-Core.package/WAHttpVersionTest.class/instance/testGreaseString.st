tests
testGreaseString
	| version |
	version := WAHttpVersion 
		major: 1
		minor: 0.
	self assert: version greaseString = 'HTTP/1.0'