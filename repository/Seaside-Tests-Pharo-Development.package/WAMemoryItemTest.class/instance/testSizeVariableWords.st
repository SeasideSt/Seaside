testing
testSizeVariableWords
	"Is 12 in Pharo5 (Spur VM)"
	self assert: (item sizeOfObject: (Array new: 1)) equalsAny: #(8 12 16)