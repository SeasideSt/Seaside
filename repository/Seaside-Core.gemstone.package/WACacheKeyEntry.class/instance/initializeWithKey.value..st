initialization
initializeWithKey: aKey value: anObject
	self initialize.
	key := aKey.
	keyHash := aKey hash.
	value := anObject