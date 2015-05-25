tests-accessing
testAtIfAbsent
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.

	self assert: (merged at: 'foo' ifAbsent: [ true ]) = 1.
	self assert: (merged at: 'bar' ifAbsent: [ true ]) = 2.
	two at: 'foo' put: 3.
	self assert: (merged at: 'foo' ifAbsent: [ true ]) = 1.
	self assert: (merged at: 'zork' ifAbsent: [ true ])