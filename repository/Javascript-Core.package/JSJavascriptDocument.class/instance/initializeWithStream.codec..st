initialization
initializeWithStream: aStream codec: aCodec
	super initializeWithStream: aStream codec: aCodec.
	javascriptStringEncoder := GRPlatform current javascriptStringEncoderOn: aStream.
	urlEncoder := GRPlatform current urlEncoderOn: aStream codec: aCodec.