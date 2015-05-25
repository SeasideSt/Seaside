instance creation
builder
	^ super builder
		documentClass: WAXmlDocument;
		rootClass: RRRssRoot;
		yourself