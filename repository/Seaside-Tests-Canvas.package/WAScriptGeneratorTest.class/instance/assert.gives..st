private
assert: aBlock gives: aString
	| html |
	html := WAHtmlCanvas builder
		fullDocument: true;
		scriptGeneratorClass: self scriptGeneratorClass;
		render: aBlock.
	self assert: aString = html