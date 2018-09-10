accessing
pathUnencoded: aString codec: aCodec
	aString = '/' ifTrue: [
		pathEncoded := '/'.
		^ self ].

	pathEncoded := String new: (aString size * 1.1) greaseInteger streamContents: [ :stream |
			| codec encoder |
			codec := aCodec isNil ifTrue: [ self requestContext codec ] ifFalse: [ aCodec ].
			encoder := GRPlatform current urlEncoderOn: stream codec: codec.
			GRPlatform subStringsIn: aString splitBy: $/ do: [ :each |
				stream nextPut: $/.
				encoder nextPutAll: each ] ]