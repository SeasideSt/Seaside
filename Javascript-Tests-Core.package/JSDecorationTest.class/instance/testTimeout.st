tests
testTimeout
	| mock |
	mock := self mock.
	mock timeout: 123.
	self assert: mock equals: 'setTimeout(function(){mock},123)'