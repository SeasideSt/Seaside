initialization
initializeWithValue: anObject key: aKey
	self initialize.
	value := anObject.
	valueHash := anObject hash.
	key := aKey