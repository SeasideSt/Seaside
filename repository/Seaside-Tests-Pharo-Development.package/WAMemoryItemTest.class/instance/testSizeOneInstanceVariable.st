testing
testSizeOneInstanceVariable
	self assert: (item sizeOfObject: WAValueHolder new) equalsAny: #(12 16)