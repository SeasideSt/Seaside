tests-utilities
testLogger
	self assert: (self script logger log: 'Hello Wold') equals: 'console.log("Hello Wold")'