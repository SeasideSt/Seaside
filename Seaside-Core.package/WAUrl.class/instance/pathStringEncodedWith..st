converting
pathStringEncodedWith: aCodec
	| size |
	"estimate the buffer size"
	size := (self pathStringUnencodedSize * 1.1) greaseInteger.
	^ String new: size streamContents: [ :stream |
		self pathEncodedWith: aCodec on: stream ]