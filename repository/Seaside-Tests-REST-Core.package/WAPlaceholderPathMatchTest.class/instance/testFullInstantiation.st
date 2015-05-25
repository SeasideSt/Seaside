tests
testFullInstantiation
	| match |
	match := WAPPathMatch fromString: '{7}' index: 2 arguments: #().
	self assert: (match isKindOf: WAFullPlaceholderPathMatch).
	self assert: match priority = 2.
	self assert: match sourceIndex = 2.
	self assert: match targetIndex = 7