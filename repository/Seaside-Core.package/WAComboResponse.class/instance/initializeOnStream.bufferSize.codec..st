initialization
initializeOnStream: aStream bufferSize: anInteger codec: aGRCodec
	"Initialize the receiver"

	| rawBufferedStream |
	self initialize.
	codec := aGRCodec.
	rawBufferedStream := GRPlatform current writeCharacterStreamOn: (aGRCodec encodedStringClass new: anInteger).
	bufferedStream := aGRCodec encoderFor: rawBufferedStream.
	externalStream := aStream.
	committed := false.
	closed := false