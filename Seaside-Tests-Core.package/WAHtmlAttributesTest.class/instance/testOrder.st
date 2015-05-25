tests
testOrder
	self
		assert: [ :attr | attr at: 'a' put: 1; at: 'b' put: 2; at: 'c' put: 3 ]
		gives: ' a="1" b="2" c="3"'.
	self
		assert: [ :attr | attr at: 'a' put: 1; at: 'b' put: 2; at: 'c' put: 3; at: 'b' put: 4 ]
		gives: ' a="1" b="4" c="3"'