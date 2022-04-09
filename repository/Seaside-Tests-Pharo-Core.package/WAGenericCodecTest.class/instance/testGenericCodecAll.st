tests
testGenericCodecAll
	GRPharoZnCodec supportedEncodingNames do: [ :name | 
		(GRPharoLatin1Codec supportedEncodingNames includes: name) ifFalse: [
			| codec |
			codec := GRCodec forEncoding: name.
			self assert: codec name = name.
			self assert: (codec isKindOf: GRPharoZnCodec) ] ]