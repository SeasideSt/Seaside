tests-testing
testIsEmpty
	self assert: merged isEmpty.
	two at: 'bar' put: 2.
	self deny: merged isEmpty.
	two removeKey: 'bar'.
	one at: 'foo' put: 1.
	self deny: merged isEmpty.
	two at: 'foo' put: 2.
	self deny: merged isEmpty