instance creation
contentString: aString
	^ self new
		contentString: (self convertCrLfToCrIn: aString);
		yourself