private
parseMultiPartFileFieldWithMimePart: aMimePart boundary: aBoundary decodeWith: aBlock
	| fullBoundary filePathString |
	fullBoundary := String crlf asByteArray, aBoundary.
	filePathString := GRPlatform current newTemporaryFile.
	GRPlatform current
		writeFileStreamOn: filePathString
		do: [ :writer |
			self
				parseMultiPartFieldWithoutLengthWithBoundary: fullBoundary
				writeOn: writer ]
		binary: true.
	
	aBlock
		value: aMimePart
		value: filePathString