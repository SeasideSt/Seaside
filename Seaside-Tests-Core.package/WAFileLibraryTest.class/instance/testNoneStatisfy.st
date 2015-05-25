tests
testNoneStatisfy
	self deny: (#(1 2 3) noneSatisfy: [ :each |
		each even ]).
	self assert: (#(1 3 5) noneSatisfy: [ :each |
		each even ])