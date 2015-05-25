tests
testRemoveKey
	attributes at: 'id' put: 'foo'.
	self assert: (attributes removeKey: 'id') = 'foo'.
	self assert: (attributes removeKey: 'id') isNil