accessing
factory
	"Answer a factory object for Prototype objects."

	^ (PTFactory context: self renderContext)
		rendererClass: self rendererClass;
		yourself