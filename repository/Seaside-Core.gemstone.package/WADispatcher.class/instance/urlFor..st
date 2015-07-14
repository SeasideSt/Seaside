accessing
urlFor: aRequestHandler
	^ self url
		addToPath: (self nameOfHandler: aRequestHandler);
		yourself