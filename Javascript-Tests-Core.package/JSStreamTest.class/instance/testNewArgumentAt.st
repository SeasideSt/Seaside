tests-constructor
testNewArgumentAt
	self assert: (JSStream argumentAt: 1) equals: 'arguments[0]'.
	self assert: (JSStream argumentAt: 2) equals: 'arguments[1]'.
	self deny: (JSStream argumentAt: 1) == (JSStream argument: 1)