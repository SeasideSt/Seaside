tests
testArgument
	| stream |
	stream := self stream argument: 1.
	self assert: stream contents = '(1)'