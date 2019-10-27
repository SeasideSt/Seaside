tests
testByteArraySeasideMimeDocumentType
	| document mpeg |
	mpeg := WAMimeType main: 'audio' sub: 'mpeg'.
	document :=  (WABlockMimeDocument onBlock: [ #(1 2 3 4) asByteArray ]) seasideMimeDocumentType: mpeg.
	self assert: document mimeType = mpeg.
	self assert: document contents = #(1 2 3 4) asByteArray 