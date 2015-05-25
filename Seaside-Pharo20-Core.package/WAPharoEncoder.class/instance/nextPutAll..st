accessing
nextPutAll: aString
	aString isByteString
		ifTrue: [ self nextPutAllFast: aString ]
		ifFalse: [
			"slow fall back for WideStrings"
			delegate nextPutAll: aString ]