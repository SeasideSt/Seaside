private
assert: aString xmlEncodedGives: anEncodedString
	| actual |
	actual := String streamContents: [ :stream |
		(GRPlatform current xmlEncoderOn: stream) nextPutAll: aString ].
	self assert: actual = anEncodedString