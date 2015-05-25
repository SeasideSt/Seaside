*comet-core
flushComet
	"Flush the receiver and answer if the stream is still in a valid state and both ends are properly connected."

	self flush.
	^ externalStream flushComet