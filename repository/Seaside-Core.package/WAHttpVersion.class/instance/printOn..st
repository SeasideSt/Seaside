printing
printOn: aStream
	aStream nextPutAll: 'HTTP/'.
	major printOn: aStream.
	aStream nextPut: $..
	minor printOn: aStream