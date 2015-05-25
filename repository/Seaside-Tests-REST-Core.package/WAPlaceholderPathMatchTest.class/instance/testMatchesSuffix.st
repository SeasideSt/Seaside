tests
testMatchesSuffix
	| match |
	match := WAPPathMatch fromString: '{7}.bar' index: 1 arguments: #().
	self assert: (match matches: 'foo.bar').
	self deny: (match matches: '.bar').
	self deny: (match matches: 'foo.barz').
	self deny: (match matches: 'foo.ba')