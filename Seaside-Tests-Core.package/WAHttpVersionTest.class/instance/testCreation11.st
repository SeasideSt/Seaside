tests
testCreation11
	| version |
	version := WAHttpVersion http11.
	
	self assert: version major = 1.
	self assert: version minor = 1