accessing
pathUnencoded: aString codec: aCodec
	path := aString.
	pathEncoded := aString isNil
		ifTrue: [ '/' ]
		ifFalse: [
			| codec |
			codec := aCodec isNil ifTrue: [ self requestContext codec ] ifFalse: [ aCodec ].
			String new: (aString size * 1.1) greaseInteger streamContents: [ :stream |
				| encoder |
				encoder := GRPlatform current urlEncoderOn: stream codec:  codec.
				GRPlatform subStringsIn: path splitBy: $/ do: [ :each |
					stream nextPut: $/.
					encoder nextPutAll: each ] ] ]