*seaside-json-core
jsonEncoderOn: aStream
	"Answer an JSON encoder that works on aStream.
	Platforms may provide optimized implementations."
	^ WAJsonEncoder on: aStream