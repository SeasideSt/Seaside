public
mapArgumentsWithElements: aCollection into: anArray usingOffset: anInteger
	anArray
		at: targetIndex
		put: (aCollection at: sourceIndex + anInteger)