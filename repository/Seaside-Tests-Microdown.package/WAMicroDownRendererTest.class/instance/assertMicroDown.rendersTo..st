asserting
assertMicroDown: aMicrodownString rendersTo: htmlString

	| renderedString |
	renderedString := WAHtmlCanvas builder render:[ :html | html microDown: aMicrodownString ].
	self assert: renderedString equals: htmlString.