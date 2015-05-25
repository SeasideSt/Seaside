tests
testPrefixInstantiation
	| match |
	match := WAPPathMatch fromString: 'foo.{787}' index: 2 arguments: #().
	self assert: (match isKindOf: WAPrefixPlaceholderPathMatch).
	self assert: match priority = 3.
	self assert: match sourceIndex = 2.
	self assert: match targetIndex = 787