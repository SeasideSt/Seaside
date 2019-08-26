tests
testWithBinaryStream
	(FileSystem memory / 'socket') binaryWriteStreamDo: [ :binaryStream |
		response := WAComboResponse
			onStream: binaryStream
			bufferSize: 4096
			codec: GRPharoUtf8Codec new.
			
		response
			nextPut: Character space;
			flush;
			close ]
		
	