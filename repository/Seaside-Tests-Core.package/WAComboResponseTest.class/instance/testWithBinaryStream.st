tests
testWithBinaryStream
	(FileSystem memory / 'socket') binaryWriteStreamDo: [ :binaryStream |
		response := WAComboResponse
			onStream: binaryStream
			bufferSize: 4096
			codec: (GRCodec forEncoding: 'utf-8').
			
		response
			nextPut: Character space;
			flush;
			close ]
		
	