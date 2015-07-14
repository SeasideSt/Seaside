accessing
at: aKey ifAbsent: aBlock
	^ mutex critical: [
		cache at: aKey ifAbsent: aBlock ]