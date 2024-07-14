instance creation
new
	^ self basicNew initializeWithId:  'id-', UUID new asString