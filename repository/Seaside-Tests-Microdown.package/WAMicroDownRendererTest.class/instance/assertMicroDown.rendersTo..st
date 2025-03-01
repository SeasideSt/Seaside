asserting
assertMicroDown: aMicrodownString rendersTo: htmlString

	| renderedString |
	renderedString := WAHtmlCanvas builder render:[ :html | WAMicroDownRenderer on: html render: aMicrodownString ].
	self assert: renderedString equals: htmlString.