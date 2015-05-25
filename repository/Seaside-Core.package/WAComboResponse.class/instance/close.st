initialization
close
	"Send a zero-sized chunk to end the data transfer."

	closed ifTrue: [ self error: 'Response is closed' ].
	externalStream nextPutAll: '0'; crlf; crlf; flush.
	closed := true
