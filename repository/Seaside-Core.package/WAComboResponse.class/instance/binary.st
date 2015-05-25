streaming
binary
	"put the response stream into binary mode"

	bufferedStream := (GRCountingStream on: (GRPlatform current readWriteByteStream)).
	externalStream binary