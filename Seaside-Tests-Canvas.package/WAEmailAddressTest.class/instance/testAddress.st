tests
testAddress
	| address |
	address := WAEmailAddress address: 'philippe.marschall@gmail.com'.
	self assert: address address = 'philippe.marschall@gmail.com'.
	self assert: address username isNil.
	self assert: address greaseString = 'philippe.marschall@gmail.com'