testing
testSizeStringPadding
	"8 would be correct and fixed in Pharo 3.0
	earlier versions answer 6"
	self assert: (item sizeOfObject: 'aa') equalsAny: #(6 8)