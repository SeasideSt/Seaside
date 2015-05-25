tests
testInstantiation
	| match |
	match := WAOrPathMatch fromString: 'path' index: 1 arguments: #().
	self assert: (match isKindOf: WAOrPathMatch).
	self assert: match priority = 3