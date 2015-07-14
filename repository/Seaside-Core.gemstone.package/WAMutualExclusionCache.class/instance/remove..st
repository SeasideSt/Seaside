removing
remove: anObject
	^ mutex critical: [
		cache remove: anObject ]