tests
testStringVersionStringParsing
	| version string |
	string := 'HTTP/1.0'.
	version := WAHttpVersion fromString: string.
	
	self assert: version major = 1.
	self assert: version minor = 0