test
testRefresh
	| moBlob fs file translator |
	moBlob := WAMOFileTest anMOBinary.
	fs := FileSystem memory.
	file := fs / 'en_nl.mo'.
	translator := WAGetTextTranslator new.
	
	self deny: file exists equals: true.
	file asFileReference binaryWriteStreamDo: [ :stream | stream nextPutAll: moBlob ].
	self deny: file exists equals: false.
	self deny: ((file binaryReadStream) contents size) equals: 0.
	
	translator loadMOFiles: { file }.
	self assert: translator moFiles size equals: 1.
	
	translator refresh.
	self assert: translator moFiles size equals: 0.