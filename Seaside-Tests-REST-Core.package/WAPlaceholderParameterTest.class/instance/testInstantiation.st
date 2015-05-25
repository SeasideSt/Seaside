tests
testInstantiation
	| match |
	match := WAParameterMatch name: 'rev' value: '{1}' arguments: #().
	self assert: (match isKindOf: WAPlaceholderParameterMatch).
	self assert: match index = 1