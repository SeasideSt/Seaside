tests
testAddressUsername
	| address |
	address := WAEmailAddress 
		address: 'philippe.marschall@gmail.com'
		username: 'Philippe Marschall'.
	self assert: address address = 'philippe.marschall@gmail.com'.
	self assert: address username = 'Philippe Marschall'.
	self assert: address greaseString = '"Philippe Marschall" <philippe.marschall@gmail.com>'