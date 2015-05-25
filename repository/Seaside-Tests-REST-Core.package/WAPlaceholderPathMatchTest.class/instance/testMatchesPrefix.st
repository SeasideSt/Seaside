tests
testMatchesPrefix
	| match |
	match := WAPPathMatch fromString: 'foo.{7}' index: 1 arguments: #().
	self assert: (match matches: 'foo.bar').
	self deny: (match matches: 'foo.').
	self deny: (match matches: 'fo.bar').
	self deny: (match matches: 'oo.bar')