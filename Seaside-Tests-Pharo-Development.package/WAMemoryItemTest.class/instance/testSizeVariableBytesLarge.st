testing
testSizeVariableBytesLarge
	self assert: (item sizeOfObject: (ByteArray new: 256)) equals: 268