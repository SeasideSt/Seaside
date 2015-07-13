instance creation
value: anObject key: aKey
	^ self basicNew
		initializeWithValue: anObject key: aKey
		yourself