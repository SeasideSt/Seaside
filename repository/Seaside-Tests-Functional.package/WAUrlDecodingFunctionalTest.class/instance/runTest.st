actions
runTest
	| success |
	success := self requestContext request url path last = self testPath.
	success
		ifTrue: [ self inform: 'Success!' onAnswer: [ "ignore" ] ]
		ifFalse: [ self inform: 'Failed!' onAnswer: [ "ignore" ] ].