tests
testWithBinaryStream
	ByteArray streamContents: [ :stream |
		response := WAComboResponse
			onStream: stream
			bufferSize: 1024
			codec: (GRCodec forEncoding: 'utf-8').
			
		response
			nextPut: Character space;
			flush;
			close ]
		
	