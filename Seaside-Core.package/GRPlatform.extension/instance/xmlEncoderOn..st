*seaside-core
xmlEncoderOn: aStream
	"Answer an XML encoder that works on aStream.
	Platforms may provide optimized implementations."
	^ WAXmlEncoder on: aStream