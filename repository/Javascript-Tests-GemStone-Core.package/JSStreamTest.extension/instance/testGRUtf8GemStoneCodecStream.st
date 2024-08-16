*javascript-tests-gemstone-core
testGRUtf8GemStoneCodecStream
	"This test is in response to https://github.com/GsDevKit/Grease/issues/33.
	This stream is used for FastCGI and doesn't show in other test cases
	due to their user of standard WriteStream instances."

	| actual |
	actual := String streamContents: [ :stream |
		(GRUtf8GemStoneCodec new encoderFor: stream)
			javascript: '<script></script>' ].
	self
		assert: actual
		equals: '"\x3Cscript>\x3C/script>"'

