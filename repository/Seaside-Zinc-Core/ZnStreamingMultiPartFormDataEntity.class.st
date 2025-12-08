"
I implement chunked reading of multipart/form-data requests. I use a ZnRingBuffer to reduce the number of operations and the amount of memory consumed during this.

I handle file parts by writing them to temporary files on disk in chunks, thus preventing the image from exhausting memory resources.
"
Class {
	#name : 'ZnStreamingMultiPartFormDataEntity',
	#superclass : 'ZnMultiPartFormDataEntity',
	#instVars : [
		'stream'
	],
	#classVars : [
		'TemporaryFileDirectory'
	],
	#category : 'Seaside-Zinc-Core',
	#package : 'Seaside-Zinc-Core'
}

{ #category : 'private' }
ZnStreamingMultiPartFormDataEntity >> parseMultiPartFieldWithMimePart: aMimePart decodeWith: aBlock [
	| reader |
	reader := (aMimePart entityReaderOn: stream)
		binary;
		streaming;
		yourself.
	aMimePart entity: reader readEntity.
	
	aBlock value: aMimePart
]

{ #category : 'private' }
ZnStreamingMultiPartFormDataEntity >> parseMultiPartFieldWithoutLengthWithBoundary: aBoundary writeOn: writer [

	| bufferSize rawBuffer buffer boundaryMarker |
	"Can't simply use a larger buffer as we don't want to read past a boundary, those bytes will belong to the next part"
	bufferSize := aBoundary size.
	rawBuffer := ByteArray new: bufferSize.
	buffer := GRPlatform current ringBufferClass on: rawBuffer.
	boundaryMarker := aBoundary first.

	stream atEnd ifFalse: [
		"#next:into: answers a copy of the buffer if not enough bytes could be read.
		Use rawBuffer here so we can use the primitive to replace the bytes in the buffer directly"
		stream next: bufferSize into: rawBuffer ].

	[
	(buffer indexOf: boundaryMarker ifAbsent: [ nil ])
		ifNotNil: [ :boundaryCandidateIndex |
			(boundaryCandidateIndex = 1 and: [ buffer = aBoundary ])
				ifTrue: [ "Found a boundary. We're done" true ]
				ifFalse: [
					| candidateIndex |
					candidateIndex := boundaryCandidateIndex = 1 ifTrue: [ 2 ] ifFalse: [ boundaryCandidateIndex ].
					"Write all the bytes that we know are not part of a boundary"
					1 to: candidateIndex - 1 do: [ :index | writer nextPut: (buffer at: index) ].
					"Move the rest of the buffer to the beginning of the buffer"
					buffer moveStartTo: candidateIndex.
					"Fill the rest of the buffer. Use rawBuffer here so we can use the primitive to replace the bytes in the buffer directly"
					rawBuffer := buffer copyFrom: 1 to: bufferSize.
					stream
						next: candidateIndex - 1
						into: rawBuffer
						startingAt: bufferSize - candidateIndex + 2.
					buffer initializeWithCollection: rawBuffer.
					"If the candidate was really the first token of the boundary then we now have loaded the full boundary into the buffer.
					If not we have to check for the next boundary candidate as we might have loaded the next boundary partially."
					buffer = aBoundary ] ]
		ifNil: [
			buffer nextPutAllOn: writer.
			stream atEnd
				ifFalse: [
					"#next:into: answers a copy of the buffer if not enough bytes could be read.
					Use rawBuffer here so we can use the primitive to replace the bytes in the buffer directly"
					stream next: bufferSize into: rawBuffer.
					buffer moveStartTo: 1.
					false ]
				ifTrue: [ true ] ] ] whileFalse
]

{ #category : 'private' }
ZnStreamingMultiPartFormDataEntity >> parseMultiPartFieldWithoutLengthWithMimePart: aMimePart boundary: aBoundary decodeWith: aBlock [
	| fullBoundary fieldValue |
	fullBoundary := String crlf asByteArray, aBoundary.
	fieldValue := ByteArray streamContents: [ :valueStream |
		self
			parseMultiPartFieldWithoutLengthWithBoundary: fullBoundary
			writeOn: valueStream ].
	
	aMimePart entity: (ZnEntity text: fieldValue asString).
	aBlock value: aMimePart
]

{ #category : 'private' }
ZnStreamingMultiPartFormDataEntity >> parseMultiPartFileFieldWithMimePart: aMimePart boundary: aBoundary decodeWith: aBlock [
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
]

{ #category : 'private' }
ZnStreamingMultiPartFormDataEntity >> partsDecodeWith: aDecoderBlock decodeFilesWith: aFileDecoderBlock [
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
		"When a part is empty and it is the last part then parsing headers will have consumed 
		the rest of the end boundary and the stream will be at the end. 
		In this case, the part will not have any headers."
		(part hasHeaders not or: [
			"The final boundary may have been read as a header when the last part was not a file part"
			part headers includesKey: endBoundary ]) ifFalse: [
				(part fileName notNil or: [
					part contentType notNil and: [
						part contentType isBinary ] ])
							ifFalse: [
								((part contentDispositionValues includes: 'form-data') and: [ part contentLength isNil ])
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
]

{ #category : 'initialize-release' }
ZnStreamingMultiPartFormDataEntity >> readBinaryFrom: aStream [
	stream := aStream
]
