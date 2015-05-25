tests
testAlias
	| mock |
	mock := self mock.
	mock alias: 'foo'.
	self assert: mock equals: 'foo'.
	mock alias: 'bar'; call: 'zork'.
	self assert: mock equals: 'bar.zork()'