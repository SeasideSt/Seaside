rendering
renderContentOn: html
	| url anchor |
	self renderExplanationOn: html.

	url := self requestContext request url.
	anchor := html anchor.
	anchor url rawAddToPath: self testPath.
	anchor
		callback: [ self runTest ];
		with: 'Run Test'