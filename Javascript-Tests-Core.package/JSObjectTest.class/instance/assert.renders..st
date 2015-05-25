utilities
assert: aBlock renders: aString 
	| html |
	html := WAHtmlCanvas builder
		documentClass: WAHtmlDocument;
		rootClass: WAHtmlRoot;
		fullDocument: false;
		render: aBlock.
	self 
		assert: html = aString
		description: 'Got ' , html printString , '; but expected ' , aString printString