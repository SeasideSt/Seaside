instance creation
transcript: aString request: aWARequest object: anObject

	^(self transcript: aString object: anObject)
		request: aWARequest;
		yourself