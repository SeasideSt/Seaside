instance creation
source: anFirstInteger target: aSecondInteger prefix: aString
	^ self basicNew
		initializeWithSourceIndex: anFirstInteger
		targetIndex: aSecondInteger
		prefix: aString