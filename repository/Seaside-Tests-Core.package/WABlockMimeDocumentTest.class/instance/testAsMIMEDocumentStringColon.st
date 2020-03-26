tests
testAsMIMEDocumentStringColon
	| document |
	document := WABlockMimeDocument onBlock: [ 'hello Seaside' ].
	document mimeType: 'text/x-weirdo' seasideMimeType.
	self assert: document contentType = 'text/x-weirdo' seasideMimeType.
	self assert: document content = 'hello Seaside'