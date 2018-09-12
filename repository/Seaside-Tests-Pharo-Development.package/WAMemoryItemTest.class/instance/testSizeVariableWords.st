testing
testSizeVariableWords
	"Is 16 in Pharo 7 64bit
	Is 12 in Pharo5 (Spur VM)"
	self assert: (item sizeOfObject: (Array new: 1)) equalsAny: #(8 12 16)