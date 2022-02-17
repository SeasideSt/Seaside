putting
store: anObject
	^ mutex critical: [
		cache store: anObject ]