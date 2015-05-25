*seaside-core
urlEncoderOn: aStream
	"Answer an URL encoder that works on aStream.
	Platforms may provide optimized implementations."
	^ WAUrlEncoder on: aStream