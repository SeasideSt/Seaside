Extension { #name : #GRPlatform }

{ #category : #'*seaside-json-core' }
GRPlatform >> jsonEncoderOn: aStream [
	"Answer an JSON encoder that works on aStream.
	Platforms may provide optimized implementations."
	^ WAJsonEncoder on: aStream
]
