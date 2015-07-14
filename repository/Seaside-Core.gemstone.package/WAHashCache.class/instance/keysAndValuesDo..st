enumerating
keysAndValuesDo: aTwoArgumentBlock
	self sweepIncrementally.
	keyTable do: [ :each |
		| cacheEntry |
		cacheEntry := each.
		[ cacheEntry isNil ] whileFalse: [
			aTwoArgumentBlock value: cacheEntry key value: cacheEntry value.
			cacheEntry := cacheEntry next ] ]