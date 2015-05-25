tests
testNamedInstantiation
	| match |
	match := WAPPathMatch fromString: '{put}' index: 2 arguments: #('get' 'put' 'post').
	self assert: (match isKindOf: WAFullPlaceholderPathMatch).
	self assert: match priority = 2.
	self assert: match sourceIndex = 2.
	self assert: match targetIndex = 2