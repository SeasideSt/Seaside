tests
testGreaseString
	| address |
	address := WAEmailAddress 
		address: 'philippe.marschall@gmail.com'
		username: 'Philippe Marschall'.
	self assert: address greaseString = '"Philippe Marschall" <philippe.marschall@gmail.com>'