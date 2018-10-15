tests-literals
testCodecStream
	| actual |
	actual := String streamContents: [ :stream |
		(GRNullCodec new encoderFor: stream)
			javascript: 'OK' ].
	self assert: actual = '"OK"'