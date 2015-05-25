public
flush
	"Flush the receiver and send partial content"

	committed ifFalse: [ self commit ].

	"Write the partial content if any"
	self nextChunk: bufferedStream count put: bufferedStream contents.
	bufferedStream reset