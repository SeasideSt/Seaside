testing
testSizeStringPadding
	"12 in Pharo 5.0 (Spur VM)
	8 in Pharo 3.0 and 4.0
	earlier versions answer 6"
	self assert: (item sizeOfObject: 'aaaa') equalsAny: #(6 8 12 16)