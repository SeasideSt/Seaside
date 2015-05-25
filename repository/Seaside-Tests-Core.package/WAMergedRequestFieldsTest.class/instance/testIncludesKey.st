tests-testing
testIncludesKey
	one at: 'foo' put: 1.
	two at: 'baz' put: 3.
	two at: 'bar' put: 2.
	two at: 'baz' put: 3.
	self assert: (merged includesKey: 'foo').
	self assert: (merged includesKey: 'bar').
	self assert: (merged includesKey: 'baz').
	self deny: (merged includesKey: 'zork')