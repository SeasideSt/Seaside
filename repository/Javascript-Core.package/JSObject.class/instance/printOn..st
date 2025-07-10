printing
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll: ' ('.
	JSJavascriptCanvas builder
		render: self
		on: aStream.
	aStream nextPut: $)