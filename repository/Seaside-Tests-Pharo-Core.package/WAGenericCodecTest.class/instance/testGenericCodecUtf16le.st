tests
testGenericCodecUtf16le
	| codec bom |
	codec := GRCodec forEncoding: 'utf-16'.
	self assert: (codec isKindOf: GRPharoZnCodec).
	bom := self asString: #(255 254).
	self assert: codec name = 'utf-16'.
	self assert: (#('utf-8' 'utf8') includes: codec url name).
	self assert: ((codec url isKindOf: GRPharoZnCodec) or:[ codec url name = 'utf-8' ]).
	codec url encodedStringClass == ByteArray
		ifTrue: [ self assert: (codec encode: self latin1String) = self utf16ByteArray ]
		ifFalse: [ self assert: (codec encode: self latin1String) = self utf16beString ].
	codec url encodedStringClass == ByteArray
		ifTrue:[ self assert: (codec url encode: self latin1String) = self utf8ByteArray ]
		ifFalse:[ self assert: (codec url encode: self latin1String) = self utf8String ].
	self assert: (codec decode: bom , self utf16leString) = self latin1String.
	self assert: (codec url decode: self utf8String) = self latin1String
	
