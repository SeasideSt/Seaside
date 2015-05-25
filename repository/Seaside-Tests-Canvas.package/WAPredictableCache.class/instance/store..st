public
store: anObject
	"Store anObject in the cache, generating a new random key. Return the key."
	
	| key |
	mutex critical: [
		key := nextKey greaseString.
		nextKey := nextKey + 1.
		objectsByKey at: key put: anObject.
		keysByObject at: anObject put: key.
		self notifyStored: anObject key: key ].
	
	^ key