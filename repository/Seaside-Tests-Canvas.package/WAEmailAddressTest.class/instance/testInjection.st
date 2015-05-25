tests
testInjection
	| address |
	address := WAEmailAddress address: 'philippe.marschall@gmail.com' , (String 
				with: Character cr
				with: Character lf) , 'Evil-Header: evil-value'.
	self assert: address address = 'philippe.marschall@gmail.com'.
	self assert: address username isNil.
	self assert: address greaseString = 'philippe.marschall@gmail.com'