initialization
initializeTable
	"Initializes the encoding table."
	| stream characterLimit |
	characterLimit := self maximumCharacterValue.
	"character values at zero so we need to add 1"
	table := Array new: characterLimit + 1.
	stream := WriteStream on: (String new: 6).
	0 to: characterLimit do: [ :index | 
		| character value |
		character := Character codePoint: index.
		self encode: character on: stream reset.
		"Smalltalk indices are one based but character values start at 0"
		value := stream contents = (String with: character)
			ifTrue: [ nil ]
			ifFalse: [ stream contents ].
		table at: index + 1 put: value ]