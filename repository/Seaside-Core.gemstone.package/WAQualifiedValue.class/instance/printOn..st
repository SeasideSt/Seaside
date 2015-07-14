printing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPut: $(;
		print: value;
		nextPutAll: ',q=';
		print: quality;
		nextPut: $)