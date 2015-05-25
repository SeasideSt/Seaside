*javascript-core
logger
	^ (JSLogger context: self context)
		rendererClass: self species;
		yourself