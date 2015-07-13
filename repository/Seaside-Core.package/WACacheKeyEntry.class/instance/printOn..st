printing
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $(.
	key printOn: aStream.
	aStream nextPutAll: ' -> '.
	value printOn: aStream.
	aStream nextPut: $)