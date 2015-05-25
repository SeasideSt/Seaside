processing
handleAnswer: anObject continueWith: aBlock
	(self validate: anObject)
		ifTrue: [ aBlock value ]