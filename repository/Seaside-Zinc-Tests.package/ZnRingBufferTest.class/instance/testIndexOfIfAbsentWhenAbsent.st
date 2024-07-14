tests
testIndexOfIfAbsentWhenAbsent
	| buffer index |
	buffer := GRPlatform current ringBufferClass new: 5.
	
	index := buffer
		indexOf: 1
		ifAbsent: [ 2 ].
	self assert: index equals: 2