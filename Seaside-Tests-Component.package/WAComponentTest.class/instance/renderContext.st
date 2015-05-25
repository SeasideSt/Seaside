accessing
renderContext
	^ WARenderContext new
		actionUrl: WAUrl new;
		document: (WAHtmlDocument on: (WriteStream on: String new));
		yourself