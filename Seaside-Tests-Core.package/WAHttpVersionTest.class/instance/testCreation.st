tests
testCreation
	| version |
	version := WAHttpVersion major: 1 minor: 0.
	
	self assert: version major = 1.
	self assert: version minor = 0