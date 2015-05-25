testing
includesKey: aKey
	^ delegates anySatisfy: [ :each | each includesKey: aKey ]