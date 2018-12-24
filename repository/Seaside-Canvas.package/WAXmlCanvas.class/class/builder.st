instance creation
builder
	^ super builder
		documentClass: WAXmlDocument;
		rootClass: WAXmlRoot;
		yourself