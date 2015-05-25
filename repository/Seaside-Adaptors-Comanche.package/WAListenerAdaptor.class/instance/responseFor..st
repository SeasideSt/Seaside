converting
responseFor: aSocketStream
	^ WAStreamedResponse
		on: (GRSwitchableStream
			onCodecStream: (self codec encoderFor: aSocketStream)
			socketStream: aSocketStream)