initialization
initializeOnBuffered: aBufferedStream external: anExternalStream
	"Initialize the receiver"

	self initialize.
	bufferedStream := aBufferedStream.
	externalStream := anExternalStream.
	committed := false.
	closed := false