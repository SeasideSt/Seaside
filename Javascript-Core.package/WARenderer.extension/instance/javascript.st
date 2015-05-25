*javascript-core
javascript
	^ (JSScript context: self context)
		rendererClass: self species;
		yourself