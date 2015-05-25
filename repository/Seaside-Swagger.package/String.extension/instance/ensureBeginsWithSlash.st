*seaside-swagger
ensureBeginsWithSlash
	^ self first = $/
		ifTrue:[ self ]
		ifFalse:[ '/',self]