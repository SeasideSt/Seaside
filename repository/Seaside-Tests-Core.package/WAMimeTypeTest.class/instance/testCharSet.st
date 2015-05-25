tests
testCharSet
	| mimeType |
	mimeType := WAMimeType fromString: 'text/html'.
	mimeType charset: 'utf-8'.
	self assert: mimeType greaseString = 'text/html;charset=utf-8'