tests
testMatches
	| match |
	match := WAOrPathMatch fromString: '[path|parameters]' index: 1 arguments: #().
	self assert: (match matches: 'path').
	self assert: (match matches: 'parameters').
	self deny: (match matches: 'poth').
	
	match := WAOrPathMatch fromString: '[path|or|parameters]' index: 1 arguments: #().
	self assert: (match matches: 'path').
	self assert: (match matches: 'parameters').
	self assert: (match matches: 'or').
	self deny: (match matches: 'poth')