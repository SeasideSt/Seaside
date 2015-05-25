converting
pathStringUnencoded
	"Answer the path converted to a string without doing URL or HTML escaping."

	"allocate with correct size, avoid copy"
	| string stream commonElementClass |
	commonElementClass := self detectCommonPathElementClass.
	commonElementClass isNil ifTrue: [
		^ self pathStringSafeUnencoded ].
	string := commonElementClass new: self pathStringUnencodedSize.
	stream := WriteStream on: string.
	self pathUnencodedOn: stream.
	^ string