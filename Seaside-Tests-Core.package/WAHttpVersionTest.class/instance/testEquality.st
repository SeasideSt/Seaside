tests
testEquality
	| a10 b10 a11 |
	a10 := WAHttpVersion major: 1 minor: 0.
	b10 := WAHttpVersion major: 1 minor: 0.
	a11 := WAHttpVersion major: 1 minor: 1.
	
	self assert: a10 = b10.
	self assert: a10 <= b10.
	self assert: a10 >= b10.
	self deny: a10 = a11