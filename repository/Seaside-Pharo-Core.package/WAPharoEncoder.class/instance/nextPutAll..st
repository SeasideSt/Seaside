accessing
nextPutAll: aString
	(aString isString and: [ aString isByteString ])
		ifTrue: [ self nextPutAllFast: aString ]
		ifFalse: [
			"slow fall back for WideStrings"
			delegate nextPutAll: aString ]