printing
printOn: aStream 
	super printOn: aStream.
	
	aStream
		nextPutAll: ' (argumentCount: '; print: self argumentCount;
		nextPutAll: ' matchesJustOneElement: '; print: self matchesJustOneElement;
		nextPutAll: ' priority: '; print: self priority;
		nextPut: $)