accessing
keyAtValue: anObject ifAbsent: aBlock
	^ mutex critical: [
		cache keyAtValue: anObject ifAbsent: aBlock ]