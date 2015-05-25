values
at: aSymbol put: anObject 
	self addExpression: ((WAValueExpression key: aSymbol)
			value: anObject;
			yourself)