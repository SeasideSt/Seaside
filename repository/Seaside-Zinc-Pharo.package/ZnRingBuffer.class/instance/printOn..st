printing
printOn: aStream
	super printOn: aStream.
	
	aStream nextPut: $(.
	(self
		copyFrom: 1
		to: self size) printOn: aStream.
	aStream nextPut: $)