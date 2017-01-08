putting
at: aKey put: anObject
	^ mutex critical: [
		cache at: aKey put: anObject ]