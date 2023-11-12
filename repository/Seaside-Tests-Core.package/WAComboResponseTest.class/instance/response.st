accessing
response
	^ super response ifNil: [
		response := WAComboResponse
			onStream: (GRPlatform current writeCharacterStreamOn: (ByteArray new: 1024))
			bufferSize: 1024
			codec: (GRCodec forEncoding: 'utf-8') ]