tests
testNextPut
	| stream |
	stream := self stream nextPut: $f.
	self assert: stream contents = 'f'