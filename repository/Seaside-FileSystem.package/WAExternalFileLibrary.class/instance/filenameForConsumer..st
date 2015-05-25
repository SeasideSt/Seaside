private
filenameForConsumer: aPathConsumer
	"Answer the SpFilename pointing to the file for the given request."
	| filename |
	filename := self directory.
	[ aPathConsumer atEnd ] whileFalse: [
		filename := filename , GRPlatform current pathSeparator , aPathConsumer next ].
	^filename