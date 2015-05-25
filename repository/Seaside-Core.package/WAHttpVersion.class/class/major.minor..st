instance creation
major: majorInteger minor: minorInteger
	^ self basicNew
		initializeWithMajor: majorInteger minor: minorInteger;
		yourself