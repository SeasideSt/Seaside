printing
printOn: aStream
	super printOn: aStream.

	aStream 
		nextPutAll: ' (method: '; print: self method;
		nextPutAll: ' selector: '; print: self selector;
		nextPutAll: ' produces: '; print: self seasideMimeType;
		nextPutAll: ' consumes: '; print: consumes;
		nextPut: $)