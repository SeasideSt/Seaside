Extension { #name : #WARenderer }

{ #category : #'*Prototype-Core' }
WARenderer >> prototype [
	"Answer a Prototype factory in the context of the receiver."

	^ (PTFactory context: self context)
		rendererClass: self species;
		yourself
]
