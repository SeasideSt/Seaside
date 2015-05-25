tests
testInstantiation
	| match |
	match := WAParameterMatch name: 'rev' value: '58692' arguments: #().
	self assert: (match isKindOf: WAExactParameterMatch)