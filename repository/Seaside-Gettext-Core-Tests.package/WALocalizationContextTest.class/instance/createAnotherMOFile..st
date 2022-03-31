tests - test data
createAnotherMOFile: fs
	
	| file |
	fs createDirectory: (fs / 'fr').
	fs createDirectory: (fs / 'fr' / 'LC_MESSAGES').
	file := (fs / 'fr' / 'LC_MESSAGES' / (self appNameForTests),'mo') asFileReference. "apparently if you concatenate with '.mo' you get '..mo' in the output, why is that?"
	
	self deny: file exists equals: true.
	file asFileReference binaryWriteStreamDo: [ :stream | stream nextPutAll: (WAMOFileTest anotherMOBinary) ].
	self deny: file exists equals: false.
	self deny: ((file binaryReadStream) contents size) equals: 0.
	^ file