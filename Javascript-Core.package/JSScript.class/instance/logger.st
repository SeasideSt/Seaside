convenience
logger
	^ self add: ((JSLogger context: self renderContext)
		rendererClass: self rendererClass;
		yourself)