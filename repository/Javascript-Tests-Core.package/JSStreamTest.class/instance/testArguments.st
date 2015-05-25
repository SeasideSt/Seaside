tests
testArguments
	| stream |
	stream := self stream arguments: #(1 2 3).
	self assert: stream contents = '(1,2,3)'