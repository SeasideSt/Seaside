tests-accessing
testAtIfPresent
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.

	self assert: (merged 
		at: 'foo' 
		ifPresent: [ :value | self assert: value = 1. true ]).
	self assert: (merged
		at: 'bar'
		ifPresent: [ :value | self assert: value = 2. true ]).
	two at: 'foo' put: 3.
	self assert: (merged 
		at: 'foo' 
		ifPresent: [ :value | self assert: value = 1. true ]).
	merged
		at: 'zork'
		ifPresent: [ :value | self assert: false ]