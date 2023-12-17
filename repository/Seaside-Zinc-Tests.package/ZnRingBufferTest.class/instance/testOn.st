tests
testOn
	| buffer |
	buffer := GRPlatform current ringBufferClass on: (ByteArray new: 1).
	self assert: buffer size equals: 1.
	buffer
		at: 1
		put: 1.
	self
		should: [ buffer at: 1 put: $a ]
		raise: Error