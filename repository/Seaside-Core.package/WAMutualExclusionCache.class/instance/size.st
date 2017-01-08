accessing
size
	^ mutex critical: [
		cache size ]