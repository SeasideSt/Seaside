public
mapArgumentsWithElements: aCollection into: anArray usingOffset: anInteger
	| value |
	value := aCollection at: sourceIndex + anInteger.
	anArray
		at: targetIndex
		put: (value copyFrom: prefix size + 1 to: value size)