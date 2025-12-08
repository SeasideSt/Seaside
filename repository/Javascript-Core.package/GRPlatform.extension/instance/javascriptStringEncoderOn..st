*Javascript-Core
javascriptStringEncoderOn: aStream
	"Answer an Javascript encoder that works on aStream.
	Platforms may provide optimized implementations."
	^ JSJavascriptStringEncoder on: aStream