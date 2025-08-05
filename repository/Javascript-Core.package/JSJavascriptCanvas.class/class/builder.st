instance creation
builder
	^ (WABuilder on: self)
		documentClass: JSJavascriptDocument;
		yourself