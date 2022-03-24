test
testLoadMOFiles

	| moBlob fs file translator dir |
	moBlob := WAMOFileTest anMOBinary.
	fs := FileSystem memory.
	dir := fs / 'en_nl'.
	file := dir / 'LC_MESSAGES' / 'foo.mo'.

	self deny: file exists equals: true.
	file asFileReference binaryWriteStreamDo: [ :stream | stream nextPutAll: moBlob ].
	self deny: file exists equals: false.
	self deny: ((file binaryReadStream) contents size) equals: 0.
	
	translator := WAGetTextTranslator newFromMOFiles: dir forName: 'foo'.

	self assert: translator moFiles size equals: 1.