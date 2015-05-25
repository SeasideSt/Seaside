tests
testNamedInstantiation
	| match |
	match := WAParameterMatch name: 'rev' value: '{put}' arguments: #('post' 'put' 'get').
	self assert: (match isKindOf: WAPlaceholderParameterMatch).
	self assert: match index = 2