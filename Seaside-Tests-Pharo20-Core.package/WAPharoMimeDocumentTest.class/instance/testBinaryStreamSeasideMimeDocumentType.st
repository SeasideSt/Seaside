tests
testBinaryStreamSeasideMimeDocumentType
	| document mpeg |
	mpeg := WAMimeType main: 'audio' sub: 'mpeg'.
	document :=  #(1 2 3 4) asByteArray readStream seasideMimeDocumentType: mpeg.
	self assert: document mimeType = mpeg.
	self assert: document contents = #(1 2 3 4) asByteArray 