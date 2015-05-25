actions
raiseError
	| result |
	result := self error: 'Test Error'.
	self 
		inform: 'Signalling the error returned: ' , result greaseString
		onAnswer: [ ]