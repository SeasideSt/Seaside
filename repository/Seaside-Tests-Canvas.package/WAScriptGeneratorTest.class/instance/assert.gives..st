private
assert: aBlock gives: aString
	| html |
	html := WAHtmlCanvas builder
		fullDocument: true;
		scriptGeneratorClass: self scriptGeneratorClass;
		render: aBlock.
	self assert: html equals: aString