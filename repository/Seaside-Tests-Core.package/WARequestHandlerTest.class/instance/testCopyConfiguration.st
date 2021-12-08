tests
testCopyConfiguration
	| config copy |
	config := handler configuration.
	
	copy := handler copy.
	
	self assert: handler configuration == config.
	self deny: copy configuration == handler configuration.
	self deny: copy configuration isNil