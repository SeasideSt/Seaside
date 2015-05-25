tests
testEnsure
	| kk count |
	
	" before evaluation, ensure blocks should be unwound "
	count := 0.
	self mark: [ 2 * (self callcc: [ :cc | kk := cc. 0 ]) ].
	self assert: (self mark: [
		[ kk value: 3 ]
			ensure: [ count := count + 1 ] ])
				= 6.
	self assert: count = 1.
	
	" ensure blocks within the continuation should be unwound as well "
	count := 0.
	self mark: [ [ 2 * (self callcc: [ :cc | kk := cc. 0 ]) ] ensure: [ count := count + 1 ] ].
	self assert: count = 1.
	self assert: (kk value: 2) = 4.
	self assert: count = 2.
	self assert: (kk value: 3) = 6.
	self assert: count = 3