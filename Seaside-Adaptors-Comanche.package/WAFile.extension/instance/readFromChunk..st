*seaside-adaptors-comanche
readFromChunk: aChunk
	self contentType: aChunk contentType seasideMimeType.
	self contents: (String streamContents: [ :stream |
		aChunk saveToStream: stream ]) asByteArray