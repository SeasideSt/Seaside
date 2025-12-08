Extension { #name : 'GRPlatform' }

{ #category : '*Javascript-Core' }
GRPlatform >> javascriptStringEncoderOn: aStream [
	"Answer an Javascript encoder that works on aStream.
	Platforms may provide optimized implementations."
	^ JSJavascriptStringEncoder on: aStream
]
