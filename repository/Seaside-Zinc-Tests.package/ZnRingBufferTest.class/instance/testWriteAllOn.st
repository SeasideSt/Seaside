tests
testWriteAllOn

	| buffer temporaryFile |
	buffer := GRPlatform current ringBufferClass on: (ByteArray new: 2).
	buffer
		at: 1 put: 128;
		at: 2 put: 129.
	temporaryFile := GRPlatform current newTemporaryFile.
	[
		GRPlatform current
			writeFileStreamOn: temporaryFile
			do: [ :strm | buffer writeAllOn: strm ]
			binary: true.
		self assert: (GRPlatform current contentsOfFile: temporaryFile binary: true) equals: #[128 129]
	] ensure: [ GRPlatform current deleteFile: temporaryFile ]
