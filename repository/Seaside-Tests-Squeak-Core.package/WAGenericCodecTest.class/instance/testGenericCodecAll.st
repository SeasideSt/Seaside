tests
testGenericCodecAll
	TextConverter allEncodingNames do: [ :name | 
		(#('utf-8'), GRPharoLatin1Codec supportedEncodingNames includes: name) ifFalse: [
			| codec |
			codec := GRCodec forEncoding: name.
			self assert: codec name = name.
			self assert: (codec isKindOf: GRPharoGenericCodec) ] ]