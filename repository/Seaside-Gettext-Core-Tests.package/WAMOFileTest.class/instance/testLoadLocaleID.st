test
testLoadLocaleID
	
	| fs file anMOFile |
	fs := FileSystem memory.
	file := fs / 'en_nl.mo'.
	
	self deny: file exists equals: true.
	file asFileReference binaryWriteStreamDo: [ :stream | stream nextPutAll: (self class anMOBinary) ].
	self deny: file exists equals: false.
	self deny: ((file binaryReadStream) contents size) equals: 0.
	
	anMOFile := WAMOFile new load: file localeString: 'en'.
	self deny: anMOFile equals: nil.
	self assert: anMOFile translatedStrings size equals: 4.
	self assert: anMOFile translations size equals: 4.
	
	
	
	
	