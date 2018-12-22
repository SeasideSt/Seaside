tests
testAsMIMEDocumentFormUnknown
	| form |
	self formClassExists ifFalse: [ ^ self ].
	
	form := self sampleForm.
	self should: [ form seasideMimeDocumentType: 'foo/bar' ] raise: Error.
	self should: [ form seasideMimeDocumentType: 'foo/bar' seasideMimeType ] raise: Error.
	self should: [ form seasideMimeDocumentType: 'image/zork' ] raise: Error.
	self should: [ form seasideMimeDocumentType: 'image/zork' seasideMimeType ] raise: Error.