tests
testSuffixInstantiation
	| match |
	match := WAPPathMatch fromString: '{787}.bar' index: 2 arguments: #().
	self assert: (match isKindOf: WASuffixPlaceholderPathMatch).
	self assert: match priority = 3.
	self assert: match sourceIndex = 2.
	self assert: match targetIndex = 787