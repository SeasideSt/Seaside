initialization
readFromChunk: aChunk
	"This is where we actually read the file contents chunk wise
	and save it to disk."

	| stream |
	self contentType: aChunk contentType seasideMimeType.
	stream := StandardFileStream newFileNamed: (self temporaryDirectory fullNameFor: self temporaryFileName).
	fileSize := [ stream binary.
		aChunk saveToStream: stream ]
			ensure: [ stream close ]