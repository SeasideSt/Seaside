tests
testCopy
	| stream1 stream2 |
	stream1 := self stream nextPutAll: 'foo'.
	stream2 := stream1 copy nextPutAll: 'bar'.
	stream1 nextPutAll: 'zork'.
	self assert: stream1 contents = 'foozork'.
	self assert: stream2 contents = 'foobar'