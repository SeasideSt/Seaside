*Prototype-Core
javascriptOn: aStream
	aStream nextPutAll: '$R('; javascript: self first; nextPut: $,; javascript: self last; nextPut: $)