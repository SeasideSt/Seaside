instance creation
new
	^ self basicNew initializeWithId:  'id-', UUIDGenerator default next asString