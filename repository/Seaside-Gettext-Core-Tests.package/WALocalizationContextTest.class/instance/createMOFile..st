tests - test data
createMOFile: fs
	
	| file |
	fs createDirectory: (fs / 'nl_BE').
	fs createDirectory: (fs / 'nl_BE' / 'LC_MESSAGES').
	file := (fs / 'nl_BE' / 'LC_MESSAGES' / (self appNameForTests),'mo') asFileReference. "apparently if you concatenate with '.mo' you get '..mo' in the output, why is that?"
	
	self deny: file exists equals: true.
	file asFileReference binaryWriteStreamDo: [ :stream | stream nextPutAll: (WAMOFileTest anMOBinary) ].
	self deny: file exists equals: false.
	self deny: ((file binaryReadStream) contents size) equals: 0.
	^ file