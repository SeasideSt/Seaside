tests
testMatches
	| match |
	match := WAPPathMatch fromString: 'path' index: 1 arguments: #().
	self assert: (match matches: 'path').
	self deny: (match matches: 'poth')