Extension { #name : #JSScript }

{ #category : #'*Prototype-Core' }
JSScript >> prototype [
	"Answer a Prototype factory that automatically adds to the receiving script."
	^ (PTFactory 
		context: self renderContext
		using: (GRDelayedSend 
				receiver: self
				selector: #add:))
		rendererClass: self rendererClass;
		yourself
]
