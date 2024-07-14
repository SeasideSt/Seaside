tests
testNextPutAllOn

	| buffer temporaryFile |
	buffer := GRPlatform current ringBufferClass on: (ByteArray new: 4).
	buffer
		at: 1 put: 128;
		at: 2 put: 129;
		at: 3 put: 130;
		at: 4 put: 131.
	temporaryFile := GRPlatform current newTemporaryFile.
	[
		GRPlatform current
			writeFileStreamOn: temporaryFile
			do: [ :strm | buffer nextPutAllOn: strm ]
			binary: true.
		self assert: (GRPlatform current contentsOfFile: temporaryFile binary: true) equals: #[128 129 130 131]
	] ensure: [ GRPlatform current deleteFile: temporaryFile ].

	buffer moveStartTo: 3.
	temporaryFile := GRPlatform current newTemporaryFile.
	[
		GRPlatform current
			writeFileStreamOn: temporaryFile
			do: [ :strm | buffer nextPutAllOn: strm ]
			binary: true.
		self assert: (GRPlatform current contentsOfFile: temporaryFile binary: true) equals: #[130 131 128 129]
	] ensure: [ GRPlatform current deleteFile: temporaryFile ].