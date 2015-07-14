instance creation
trace: aString request: aWARequest object: anObject

	^(self trace: aString object: anObject)
		request: aWARequest;
		yourself