private
parseMultiPartFieldWithMimePart: aMimePart decodeWith: aBlock
	| reader |
	reader := (aMimePart entityReaderOn: stream)
		binary;
		streaming;
		yourself.
	aMimePart entity: reader readEntity.
	
	aBlock value: aMimePart