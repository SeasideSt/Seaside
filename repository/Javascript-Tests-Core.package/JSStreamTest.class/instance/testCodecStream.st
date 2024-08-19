tests-literals
testCodecStream
	| actual |
	actual := String streamContents: [ :stream |
		(GRNullCodec new encoderFor: stream)
			javascript: 'OK' ].
	self assert: actual = '"OK"'.
	
	"The second part of this test is in response to https://github.com/GsDevKit/Grease/issues/33"
	actual := (GRCodec forEncoding: 'utf8') encodedStringClass streamContents: [ :stream |
		((GRCodec forEncoding: 'utf8') encoderFor: stream)
			javascript: 'OK' ].
	self assert: actual asString = '"OK"'