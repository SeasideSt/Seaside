tests
testJavascript
	| stream |
	stream := self stream javascript: #(1 2).
	self assert: stream contents = '[1,2]'