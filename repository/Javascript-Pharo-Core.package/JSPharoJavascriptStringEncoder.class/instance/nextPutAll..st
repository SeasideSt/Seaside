accessing
nextPutAll: aString
	(aString isString and: [ aString isByteString and: [ delegate bufferIsEmpty ]])
		ifTrue: [ self nextPutAllFast: aString ]
		ifFalse: [
			"slow fall back for WideStrings"
			delegate nextPutAll: aString ]