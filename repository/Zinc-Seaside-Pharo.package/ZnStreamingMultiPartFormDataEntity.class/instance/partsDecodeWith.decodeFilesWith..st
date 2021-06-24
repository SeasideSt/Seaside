private
partsDecodeWith: aDecoderBlock decodeFilesWith: aFileDecoderBlock
	| fullBoundary endBoundary |
	fullBoundary := '--' asByteArray, self getBoundary.
	endBoundary := fullBoundary asString, '--'.
	"Sometimes there is whitespace in front of the first boundary"
	(stream match: fullBoundary) ifFalse: [ self error ].
	"Skip CRLF"
	stream skip: 2.

	[ stream atEnd ] whileFalse: [
		| part |
		part := ZnMimePart new
			headers: (ZnHeaders readFrom: stream);
			yourself.
		"When a value is empty (see comment in #parseMultiPartFieldWithoutLengthWithBoundary:writeOn:)
		and it is the last part then parsing headers will consumed the rest of the end boundary and the
		stream will be at the end. In this case, the part will not have any headers"
		(part hasHeaders not or: [
			"The final boundary may be read as a header when
			the last part was not a file part"
			part headers includesKey: endBoundary ]) ifFalse: [
				(part fileName notNil or: [
					part contentType notNil and: [
						part contentType isBinary ] ])
							ifFalse: [
								((part contentDispositionValues includes: 'form-data') and: [
									part contentLength isNil ])
										ifTrue: [
											self
												parseMultiPartFieldWithoutLengthWithMimePart: part
												boundary: fullBoundary
												decodeWith: aDecoderBlock ]
										ifFalse: [
											self
												parseMultiPartFieldWithMimePart: part
												decodeWith: aDecoderBlock ] ]
							ifTrue: [
								self
									parseMultiPartFileFieldWithMimePart: part
									boundary: fullBoundary
									decodeWith: aFileDecoderBlock ] ].
		"Skip crlf"
		stream atEnd ifFalse: [
			stream skip: 2 ] ]