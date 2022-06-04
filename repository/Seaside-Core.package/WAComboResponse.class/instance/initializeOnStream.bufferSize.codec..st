initialization
initializeOnStream: aStream bufferSize: anInteger codec: aGRCodec
	"Initialize the receiver"

	| rawBufferedStream |
	self initialize.
	codec := aGRCodec.
	rawBufferedStream := GRPlatform current writeCharacterStreamOn: (ByteArray new: anInteger).
	bufferedStream := GRCountingStream on: (aGRCodec encoderFor: rawBufferedStream).
	externalStream := GRBinaryConvertingStream on: aStream.
	committed := false.
	closed := false