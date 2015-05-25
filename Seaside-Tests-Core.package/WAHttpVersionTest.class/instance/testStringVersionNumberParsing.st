tests
testStringVersionNumberParsing
	| version string |
	string := '12.3'.
	version := WAHttpVersion fromString: string.
	
	self assert: version major = 12.
	self assert: version minor = 3