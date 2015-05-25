tests
testMatchesFull
	| match |
	match := WAPPathMatch fromString: '{7}' index: 1 arguments: #().
	self assert: (match matches: 'foo')