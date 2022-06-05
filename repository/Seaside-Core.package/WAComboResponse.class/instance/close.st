initialization
close
	"Send a zero-sized chunk to end the data transfer."

	closed ifTrue: [ self error: 'Response is closed' ].
	externalStream
		"zero length chunk"
		nextPut: 0;
		"crlf"
		nextPut: 13;
		nextPut: 10;
		"crlf"
		nextPut: 13;
		nextPut: 10;
		flush.
	closed := true