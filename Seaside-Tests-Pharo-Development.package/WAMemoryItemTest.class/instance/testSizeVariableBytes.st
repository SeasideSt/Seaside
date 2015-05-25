testing
testSizeVariableBytes
	"Pharo versions older than 3.0 are buggy and answer 9 instead of 12
	http://code.google.com/p/pharo/issues/detail?id=6440"
	self assert: (item sizeOfObject: (ByteArray new: 1)) equalsAny: #(9 12)
	
