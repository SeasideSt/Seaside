private
parseMultiPartFileFieldWithMimePart: aMimePart boundary: aBoundary decodeWith: aBlock
	| fullBoundary file |
	fullBoundary := String crlf asByteArray, aBoundary.
	file := GRPlatform current newTemporaryFileReference.
	GRPlatform current
		binaryWriteStreamFor: file
		do: [ :writer |
		self
			parseMultiPartFieldWithoutLengthWithBoundary: fullBoundary
			writeOn: writer ].
	
	aBlock
		value: aMimePart
		value: file pathString