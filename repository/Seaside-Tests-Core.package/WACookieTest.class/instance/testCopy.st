tests
testCopy
	| original copy |
	original := (WACookie key: 'meta' value: 'phor')
		ports: #(80) asOrderedCollection;
		yourself.
		
	copy := original copy.
	copy ports at: 1 put: 443.
		
	self assert: original ports size = 1.
	self assert: original ports first = 80.
	
	self assert: copy ports size = 1.
	self assert: copy ports first = 443