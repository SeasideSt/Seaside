private
parseMultiPartFieldWithoutLengthWithBoundary: aBoundary writeOn: writer
	| bufferSize rawBuffer buffer boundaryMarker |
	"Can't simply use a larger buffer as we don't want to read past a boundary,
	those bytes will belong to the next part"
	bufferSize := aBoundary size.
	rawBuffer := ByteArray new: bufferSize.
	buffer := ZnRingBuffer on: rawBuffer.
	boundaryMarker := aBoundary first.
	
	stream atEnd ifFalse: [
		"#next:into: answers a copy of the buffer if not enough bytes could be read"
		"Use rawBuffer here so we can use the primitive to replace the bytes in the 
		buffer directly"
		stream
			next: bufferSize
			into: rawBuffer ].

	[ (buffer
		indexOf: boundaryMarker
		ifAbsent: [ nil ])
			ifNotNil: [ :boundaryCandidateIndex |
				(boundaryCandidateIndex = 1 and: [ 
					buffer = aBoundary ])
						ifTrue: [
							"Found a boundary. We're done"
							true ]
						ifFalse: [
							| candidateIndex |
							candidateIndex := boundaryCandidateIndex = 1
								ifTrue: [ 2 ]
								ifFalse: [ boundaryCandidateIndex ].
								"Write all the bytes that we know are not part of a boundary"
								1
									to: candidateIndex - 1
									do: [ :index | writer nextPut: (buffer at: index) ].
								"Move the rest of the buffer to the beginning of the buffer"
								buffer moveStartTo: candidateIndex.
								
								"Fill the rest of the buffer"
								"Use rawBuffer here so we can use the primitive to replace the bytes in the 
								buffer directly"
								rawBuffer := buffer
									copyFrom: 1
									to: bufferSize.
								stream
									next: candidateIndex - 1
									into: rawBuffer
									startingAt: bufferSize - candidateIndex + 2.
								buffer initializeWithCollection: rawBuffer.
								"If the candidate was really the first token of the boundary
								then we now have loaded the full boundary into the buffer.
								If not we have to check for the next boundary candidate as
								we might have loaded the next boundary partially."
								buffer = aBoundary ] ]
				ifNil: [
					writer nextPutAll: buffer.
					stream atEnd
						ifFalse: [
							"#next:into: answers a copy of the buffer if not enough bytes could be read"
							"Use rawBuffer here so we can use the primitive to replace the bytes in the 
							buffer directly"
							stream
								next: bufferSize
								into: rawBuffer.
							buffer moveStartTo: 1.
							false ]
						ifTrue: [ true ] ] ] whileFalse