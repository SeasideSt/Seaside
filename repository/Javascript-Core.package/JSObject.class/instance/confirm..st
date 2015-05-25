convenience
confirm: anObject 
	"Show a confirmation with the message anObject before evaluating the receiver."
	
	self condition: (JSStream new
		nextPutAll: 'confirm';
		argument: anObject)