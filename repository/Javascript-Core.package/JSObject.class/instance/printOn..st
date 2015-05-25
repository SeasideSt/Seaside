printing
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll: ' ('; javascript: self; nextPut: $)