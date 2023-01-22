removing
removeKey: aKey
	^ mutex critical: [
		cache removeKey: aKey ]