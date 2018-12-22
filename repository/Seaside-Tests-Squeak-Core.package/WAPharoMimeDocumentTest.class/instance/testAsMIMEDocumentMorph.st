tests
testAsMIMEDocumentMorph
	| morph document |
	morph := EllipseMorph new
		color: Color red;
		borderWidth: 1;
		borderColor: Color black;
		extent: 12 @ 12;
		yourself.
	document := morph seasideMimeDocument.
	self assert: document contentType = WAMimeType imageGif.
	self assert: (document content isKindOf: ByteArray)