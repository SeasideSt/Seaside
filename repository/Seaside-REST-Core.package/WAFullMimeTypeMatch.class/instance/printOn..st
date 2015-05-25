printing
printOn: aStream
	super printOn: aStream.

	aStream 
		nextPutAll: ' (mimeType: '; print: self seasideMimeType;
		nextPutAll: ' priority: '; print: self priority;
		nextPut: $)