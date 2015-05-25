printing
printOn: aStream
	super printOn: aStream.

	aStream 
		nextPutAll: ' (mimeType: '; print: (WAMimeType main: '*' sub: '*');
		nextPutAll: ' priority: '; print: self priority;
		nextPut: $)