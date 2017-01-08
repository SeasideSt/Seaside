enumerating
keysAndValuesDo: aTwoArgumentBlock
	^ mutex critical: [
		cache keysAndValuesDo: aTwoArgumentBlock ]