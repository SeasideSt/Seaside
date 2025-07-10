*Javascript-Core
javascriptEncoderOn: aStream
	"Answer an Javascript encoder that works on aStream.
	Platforms may provide optimized implementations."
	^ JSJavascriptEncoder on: aStream