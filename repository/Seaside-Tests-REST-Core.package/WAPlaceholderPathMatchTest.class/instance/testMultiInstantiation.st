tests
testMultiInstantiation
	| match |
	match := WAPPathMatch fromString: '*7*' index: 2 arguments: #().
	self assert: (match isKindOf: WAMultiPlaceholderPathMatch).
	self assert: match priority = 1.
	self assert: match sourceIndex = 2.
	self assert: match targetIndex = 7