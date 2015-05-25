tests
testAsMIMEDocumentMorphColol
	| morph document |
	morph := EllipseMorph new
		color: Color red;
		borderWidth: 1;
		borderColor: Color black;
		extent: 12 @ 12;
		yourself.
	document := morph seasideMimeDocumentType: WAMimeType imageJpeg.
	self assert: document contentType = WAMimeType imageJpeg.
	self assert: (document content isKindOf: ByteArray)