tests
testCreationWithNew
	| version |
	version := WAHttpVersion new.
	
	self assert: version major = 1.
	self assert: version minor = 1