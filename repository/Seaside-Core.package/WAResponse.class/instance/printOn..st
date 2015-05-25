printing
printOn: aStream 
	super printOn: aStream.
	aStream nextPutAll: ' status: '; print: self status.
	aStream nextPutAll: ' message: '; print: self message