Extension { #name : #WARenderer }

{ #category : #'*comet-core' }
WARenderer >> comet [
	^ (CTComet context: self context)
		rendererClass: self species;
		yourself
]
