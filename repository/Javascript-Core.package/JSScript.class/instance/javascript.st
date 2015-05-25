convenience
javascript
	^ (JSScript context: self renderContext)
		rendererClass: self rendererClass;
		yourself