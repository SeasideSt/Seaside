delegation
handleAnswer: anObject
	(self next handleAnswer: anObject)
		ifFalse: [ self handleAnswer: anObject continueWith: [ ^ false ] ].
	^ true