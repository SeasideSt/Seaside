tests
testGenericCodecMacRoman
	| codec |
	codec := GRCodec forEncoding: 'mac-roman'.
	self assert: (codec isKindOf: GRPharoGenericCodec).
	self assert: codec name = 'mac-roman'.
	self assert: codec url name = 'utf-8'.
	self assert: ((codec url isKindOf: GRPharoUtf8Codec) or:[ codec url isKindOf: GRPharoDeprecatedUtf8Codec ]).
	self assert: (codec encode: self latin1String) = self macromanString.
	codec url encodedStringClass == ByteArray
		ifTrue:[ self assert: (codec url encode: self latin1String) = self utf8ByteArray ]
		ifFalse:[ self assert: (codec url encode: self latin1String) = self utf8String ].
	self assert: (codec decode: self macromanString) = self latin1String.
	self assert: (codec url decode: self utf8String) = self latin1String