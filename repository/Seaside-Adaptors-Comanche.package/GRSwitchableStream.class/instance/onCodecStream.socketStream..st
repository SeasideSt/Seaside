initialization
onCodecStream: aCodecStream socketStream: aSocketStream
	self initializeOn: aCodecStream.
	codecStream := aCodecStream.
	socketStream := aSocketStream