tests
testIsNonStandard
	| mimeType |
	mimeType := WAMimeType fromString: 'image/png'.
	self deny: mimeType isNonStandard.
	
	mimeType := WAMimeType fromString: 'image/x-icon'.
	self assert: mimeType isNonStandard.
	
	mimeType := WAMimeType fromString: 'image/X-icon'.
	self assert: mimeType isNonStandard.
	
	mimeType := WAMimeType fromString: 'x-icon/image'.
	self assert: mimeType isNonStandard.
	
	mimeType := WAMimeType fromString: 'X-icon/image'.
	self assert: mimeType isNonStandard
	
	