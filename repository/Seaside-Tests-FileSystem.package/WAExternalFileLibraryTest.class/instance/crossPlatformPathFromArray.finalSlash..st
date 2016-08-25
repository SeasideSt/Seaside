testing
crossPlatformPathFromArray: pathArray finalSlash: finalSlash
	
	^ String streamContents: [ :stream |
		| separator |
		separator := GRPlatform current pathSeparator.
		pathArray do: [ :pathElement | 
			stream
				nextPutAll: separator;
				nextPutAll: pathElement ].
		finalSlash ifTrue: [
			stream nextPutAll: separator ] ]
