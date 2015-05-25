public
mapArgumentsWithElements: aCollection into: anArray usingOffset: anInteger
	| value |
	value := aCollection at: sourceIndex + anInteger.
	anArray
		at: targetIndex
		put: (value copyFrom: 1 to: value size - suffix size)