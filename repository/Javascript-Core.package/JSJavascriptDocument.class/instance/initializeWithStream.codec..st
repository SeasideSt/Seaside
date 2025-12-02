initialization
initializeWithStream: aStream codec: aCodec
	super initializeWithStream: aStream codec: aCodec.
	javascriptEncoder := GRPlatform current javascriptEncoderOn: aStream.
	urlEncoder := GRPlatform current urlEncoderOn: aStream codec: aCodec.