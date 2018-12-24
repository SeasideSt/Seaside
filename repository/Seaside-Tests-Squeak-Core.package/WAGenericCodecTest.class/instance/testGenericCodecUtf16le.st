tests
testGenericCodecUtf16le
	| codec bom |
	codec := GRCodec forEncoding: 'utf-16'.
	self assert: (codec isKindOf: GRPharoGenericCodec).
	bom := self asString: #(255 254).
	self assert: codec name = 'utf-16'.
	self assert: codec url name = 'utf-8'.
	self assert: (codec url isKindOf: GRPharoUtf8Codec).
	self assert: (codec encode: self latin1String) = self utf16beString.
	self assert: (codec url encode: self latin1String) = self utf8String.
	self assert: (codec decode: bom , self utf16leString) = self latin1String.
	self assert: (codec url decode: self utf8String) = self latin1String