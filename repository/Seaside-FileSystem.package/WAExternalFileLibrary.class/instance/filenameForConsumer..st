private
filenameForConsumer: aPathConsumer
	"Answer the SpFilename pointing to the file for the given request."
	^ String streamContents: [ :stream |
		| pathSeparator |
		stream nextPutAll: self directory.
		pathSeparator := GRPlatform current pathSeparator.
		[ aPathConsumer atEnd ] whileFalse: [
			stream
				nextPutAll: pathSeparator;
				nextPutAll: aPathConsumer next ] ]