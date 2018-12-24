testing
testSizeVariableBytesLarge
	self assert: (item sizeOfObject: (ByteArray new: 256)) equalsAny: #(264 268)