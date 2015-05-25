convenience
withLineBreaks: aString
	"Renders text preserving line breaks."
	| stream |
	stream := aString readStream.
	[ stream atEnd ] whileFalse: [
		self text: stream nextLine.
		stream atEnd ifFalse: [ self break ] ]