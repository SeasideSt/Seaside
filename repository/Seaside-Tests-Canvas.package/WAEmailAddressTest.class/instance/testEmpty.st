tests
testEmpty
	| address |
	address := WAEmailAddress address: (String 
			with: Character cr
			with: Character lf) , 'philippe.marschall@gmail.com'.
	self assert: address address = ''.
	self assert: address username isNil.
	self assert: address greaseString = ''