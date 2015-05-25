tests
testThenElse
	| mock |
	mock := self mock.
	mock then: 1.
	self assert: mock equals: '(mock?1:null)'.

	mock := self mock.
	mock then: 1 else: 2.
	self assert: mock equals: '(mock?1:2)'