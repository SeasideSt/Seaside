tests
testCreation10
	| version |
	version := WAHttpVersion http10.
	
	self assert: version major = 1.
	self assert: version minor = 0