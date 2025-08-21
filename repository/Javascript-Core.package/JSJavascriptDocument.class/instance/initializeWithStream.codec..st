initialization
initializeWithStream: aStream codec: aCodec
	super initializeWithStream: aStream codec: aCodec.
	javascripEncoder := GRPlatform current javascriptEncoderOn: aStream.
	urlEncoder := GRPlatform current urlEncoderOn: aStream codec: aCodec.