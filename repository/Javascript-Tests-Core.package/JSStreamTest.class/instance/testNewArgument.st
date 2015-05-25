tests-constructor
testNewArgument
	self assert: (JSStream argument: 0) equals: 'arguments[0]'.
	self assert: (JSStream argument: 1) equals: 'arguments[1]'.
	self deny: (JSStream argument: 1) == (JSStream argument: 1)