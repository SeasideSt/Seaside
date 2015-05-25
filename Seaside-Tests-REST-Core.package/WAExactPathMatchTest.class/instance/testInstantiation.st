tests
testInstantiation
	| match |
	match := WAPPathMatch fromString: 'path' index: 1 arguments: #().
	self assert: (match isKindOf: WAExactPathMatch).
	self assert: match priority = 3