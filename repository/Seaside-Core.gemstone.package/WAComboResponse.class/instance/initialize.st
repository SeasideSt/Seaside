initialization
initialize
	"Initialize the receiver"

	super initialize.
	bufferedStream := GRPlatform current readWriteCharacterStream.
	committed := false.
	closed := false