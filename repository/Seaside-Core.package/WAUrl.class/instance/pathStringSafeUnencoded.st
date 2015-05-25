converting
pathStringSafeUnencoded
	"Answer the path converted to a string without doing URL or HTML escaping.
	Compared to #pathStringUnencoded, we cannot guarante to not copy here.
	"
	| stream |
	stream := WriteStream on: (String new: self pathStringUnencodedSize).
	self pathUnencodedOn: stream.
	^ stream contents