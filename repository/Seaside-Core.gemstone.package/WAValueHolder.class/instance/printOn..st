printing
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll: ' contents: '; print: self contents