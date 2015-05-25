actions
readStreamDo: aOneArgumentBlock
	"Convenience method to access a read stream on the contents. The read stream will be passed to the block.
	the stream will be in binary mode
	the stream will be closed afterwards"
	| stream |
	stream := self temporaryDirectory readOnlyFileNamed: self temporaryFileName.
	^ [	stream binary.
		aOneArgumentBlock value: stream ]
			ensure: [ stream close ]