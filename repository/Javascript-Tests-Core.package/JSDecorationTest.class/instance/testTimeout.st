tests
testTimeout
	| mock |
	mock := self mock.
	mock setTimeout: 123.
	self assert: mock equals: 'setTimeout(function(){mock},123)'