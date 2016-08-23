converting
stringForValue: anObject
	^ anObject isNil ifFalse: [
		anObject class name greaseString ]