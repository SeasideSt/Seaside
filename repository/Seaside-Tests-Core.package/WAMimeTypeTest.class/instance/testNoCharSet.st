tests
testNoCharSet
	| mimeType |
	mimeType := WAMimeType fromString: 'text/html'.
	self assert: mimeType charSet isNil