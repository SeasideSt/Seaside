initialization
initializeWithStream: aStream codec: aCodec
	super initializeWithStream: aStream codec: aCodec.
	jsonEncoder := GRPlatform current jsonEncoderOn: aStream