convenience
return: anObject 
	"Return anObject after evaluating the receiver."
	
	self , (JSStream new
		nextPutAll: 'return ';
		javascript: anObject)