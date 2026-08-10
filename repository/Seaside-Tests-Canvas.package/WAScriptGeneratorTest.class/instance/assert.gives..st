private
assert: aBlock gives: aString
	| html |
	html := WAHtmlCanvas builder
		fullDocument: true;
		scriptGeneratorClass: self scriptGeneratorClass;
		rootClass: self rootClass;
		render: aBlock.
	self assert: html equals: aString