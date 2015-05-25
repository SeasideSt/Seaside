tests-enumerating
testKeys
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.
	two at: 'foo' put: 3.
	self assert: merged keys asArray = #('foo' 'bar' 'foo')