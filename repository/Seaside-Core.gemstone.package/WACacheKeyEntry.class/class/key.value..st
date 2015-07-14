instance creation
key: aKey value: anObject
	^ self basicNew
		initializeWithKey: aKey value: anObject;
		yourself