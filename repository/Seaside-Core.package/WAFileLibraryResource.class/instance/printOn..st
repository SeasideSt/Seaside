printing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPutAll: ' cacheDuration: ';
		print: self cacheDuration.
	aStream
		nextPutAll: ' filepath: ';
		print: self filepath.
	aStream
		nextPutAll: ' mimeType: ';
		print: self mimeType.
	aStream
		nextPutAll: ' contents: ';
		print: (self contents greaseString truncateWithElipsisTo: 100)