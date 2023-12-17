private
parseMultiPartFieldWithoutLengthWithMimePart: aMimePart boundary: aBoundary decodeWith: aBlock
	| fullBoundary fieldValue |
	fullBoundary := String crlf asByteArray, aBoundary.
	fieldValue := ByteArray streamContents: [ :valueStream |
		self
			parseMultiPartFieldWithoutLengthWithBoundary: fullBoundary
			writeOn: valueStream ].
	
	aMimePart entity: (ZnEntity text: fieldValue asString).
	aBlock value: aMimePart