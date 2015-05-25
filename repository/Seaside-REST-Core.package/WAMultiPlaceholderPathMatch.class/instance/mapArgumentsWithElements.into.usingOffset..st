public
mapArgumentsWithElements: aCollection into: anArray usingOffset: anInteger
	anArray
		at: targetIndex
		put: (aCollection copyFrom: sourceIndex to: sourceIndex + anInteger)