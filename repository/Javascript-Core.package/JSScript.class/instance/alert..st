convenience
alert: anObject 
	self add: (JSStream new
		nextPutAll: 'alert';
		argument: anObject;
		yourself)