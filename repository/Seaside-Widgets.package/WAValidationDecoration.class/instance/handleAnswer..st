delegation
handleAnswer: anObject
	^ (super handleAnswer: anObject) or: [ (self validate: anObject) not ]