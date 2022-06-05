private
parseMultiPartFileFieldWithMimePart: aMimePart boundary: aBoundary decodeWith: aBlock
	| fullBoundary file |
	fullBoundary := String crlf asByteArray, aBoundary.
	file := self class temporaryFileDirectory / UUID new asString.
	GRPlatform current
		writeFileStreamOn: file pathString
		do: [ :writer |
			self
				parseMultiPartFieldWithoutLengthWithBoundary: fullBoundary
				writeOn: writer ]
		binary: true.
	
	aBlock
		value: aMimePart
		value: file pathString