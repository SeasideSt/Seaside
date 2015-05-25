instance creation
source: anFirstInteger target: aSecondInteger suffix: aString
	^ self basicNew
		initializeWithSourceIndex: anFirstInteger
		targetIndex: aSecondInteger
		suffix: aString