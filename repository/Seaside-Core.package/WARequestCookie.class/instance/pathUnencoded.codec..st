accessing
pathUnencoded: aString codec: aCodec
	| codec |
	codec := aCodec isNil ifTrue: [ self requestContext codec ] ifFalse: [ aCodec ].
	pathEncoded := String
		new: (aString size * 1.1) greaseInteger
		streamContents: [ :stream |
			| encoder |
			encoder := GRPlatform current urlEncoderOn: stream codec: codec.
			GRPlatform subStringsIn: path splitBy: $/ do: [ :each |
				stream nextPut: $/.
				encoder nextPutAll: each ] ].
	
	pathEncoded := pathEncoded isEmpty ifFalse: [ ^ self ].
	
	pathEncoded := '/'