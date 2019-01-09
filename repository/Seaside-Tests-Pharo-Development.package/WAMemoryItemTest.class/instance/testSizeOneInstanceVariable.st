testing
testSizeOneInstanceVariable
	"16 on 64bit
	12 on 32bit"
	self assert: (item sizeOfObject: WAValueHolder new) equalsAny: #(12 16) 