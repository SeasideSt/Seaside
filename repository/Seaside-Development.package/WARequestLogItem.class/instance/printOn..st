printing
printOn: aStream

	aStream nextPutAll: request url asString.
	lines do:[ :block |
		| homeMethod inClass |
		homeMethod := block method.
		inClass := homeMethod methodClass.
		aStream nextPutAll: ('  [] in {1}>>#{2}' format: { inClass name. homeMethod selector }) ]