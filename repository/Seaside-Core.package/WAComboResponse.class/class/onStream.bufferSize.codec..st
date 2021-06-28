instance creation
onStream: aStream bufferSize: anInteger codec: aGRCodec
	^ self basicNew
		initializeOnStream: aStream bufferSize: anInteger codec: aGRCodec;
		yourself