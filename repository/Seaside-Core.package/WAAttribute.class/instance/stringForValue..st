converting
stringForValue: anObject 
	^ anObject isNil ifFalse: [ anObject greaseString ]