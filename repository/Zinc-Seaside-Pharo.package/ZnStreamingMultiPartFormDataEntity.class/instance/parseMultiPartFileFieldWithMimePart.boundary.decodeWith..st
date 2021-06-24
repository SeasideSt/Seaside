private
parseMultiPartFileFieldWithMimePart: aMimePart boundary: aBoundary decodeWith: aBlock
	| fullBoundary file |
	fullBoundary := String crlf asByteArray, aBoundary.
	file := self class temporaryFileDirectory / UUID new asString.
	GRPlatform current
		binaryWriteStreamFor: file
		do: [ :writer |
		self
			parseMultiPartFieldWithoutLengthWithBoundary: fullBoundary
			writeOn: writer ].
	
	aBlock
		value: aMimePart
		value: file pathString