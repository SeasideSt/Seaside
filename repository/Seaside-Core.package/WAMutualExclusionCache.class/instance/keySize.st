accessing
keySize
	^ mutex critical: [
		cache keySize ]