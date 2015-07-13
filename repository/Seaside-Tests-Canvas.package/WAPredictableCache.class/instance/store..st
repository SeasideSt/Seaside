public
store: anObject
	"Store anObject in the cache, generating a new random key. Return the key."
	
	| key |
	key := nextKey greaseString.
	nextKey := nextKey + 1.
	self at: key put: anObject.
	
	^ key