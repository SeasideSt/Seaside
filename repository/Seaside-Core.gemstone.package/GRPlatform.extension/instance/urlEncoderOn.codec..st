*seaside-core
urlEncoderOn: aStream codec: aCodec
	"Answer an URL encoder that works on aStream.
	Platforms may provide optimized implementations."
	^ aCodec url encoderFor: (WAUrlEncoder on: aStream)