tests
testAsMIMEDocumentString
	| document |
	document := (WABlockMimeDocument onBlock: [ 'hello Seaside' ])
		mimeType: WAMimeType textPlain;
		yourself.
	self assert: document contentType = WAMimeType textPlain.
	self assert: document content = 'hello Seaside'