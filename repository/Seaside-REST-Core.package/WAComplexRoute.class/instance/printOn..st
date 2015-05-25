printing
printOn: aStream
	super printOn: aStream.

	aStream 
		nextPutAll: ' (pathMatches: '; print: pathMatches;
		nextPutAll: ' parameterMatches: '; print: parameterMatches;
		nextPutAll: ' isOverlyComplex: '; print: self isOverlyComplex;
		nextPut: $)