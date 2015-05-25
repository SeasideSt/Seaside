accessing
currentSegment
	^ stack isEmpty
		ifFalse: [ stack last value ]