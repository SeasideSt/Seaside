instance creation
builder
	^ (WABuilder on: self)
		documentClass: WAJsonDocument;
		yourself