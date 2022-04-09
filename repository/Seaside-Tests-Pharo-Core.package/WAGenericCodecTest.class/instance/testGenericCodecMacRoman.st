tests
testGenericCodecMacRoman
	| codec |
	codec := GRCodec forEncoding: 'mac-roman'.
	self assert: codec name = 'mac-roman'.
	self assert: (#('utf-8' 'utf8') includes: codec url name).
	codec encodedStringClass == ByteArray
		ifTrue: [ self assert: (codec encode: self latin1String) = self macromanByteArray ]
		ifFalse: [ self assert: (codec encode: self latin1String) = self macromanString ].
	codec url encodedStringClass == ByteArray
		ifTrue:[ self assert: (codec url encode: self latin1String) = self utf8ByteArray ]
		ifFalse:[ self assert: (codec url encode: self latin1String) = self utf8String ].
	self assert: (codec decode: self macromanString) = self latin1String.
	self assert: (codec url decode: self utf8String) = self latin1String