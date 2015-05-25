tests
testMatches
	| match |
	match := WAParameterMatch name: 'rev' value: '{1}' arguments: #().
	self assert: (match matchesName: 'rev' value: '58692').
	self assert: (match matchesName: 'rev' value: 'a').
	self deny: (match matchesName: 'revision' value: '58692')