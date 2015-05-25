*prototype-core
prototype
	"Answer a Prototype factory in the context of the receiver."

	^ (PTFactory context: self context)
		rendererClass: self species;
		yourself