testing
testAsUnsignedInteger
	"Compatibility test to make sure the method is there."
	self assert: '1' asUnsignedInteger = 1.
	self assert: '-1' asUnsignedInteger = 1.
	self assert: 'squeak' asUnsignedInteger isNil