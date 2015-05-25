public
flush
	"Flush the status code and header fields, if they haven't been written yet."

	self isCommitted
		ifFalse: [ self writeOn: externalStream ].
	externalStream flush