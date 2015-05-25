tests-enumerating
testValues
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.
	two at: 'foo' put: 3.
	self assert: merged values asArray = #(1 2 3)