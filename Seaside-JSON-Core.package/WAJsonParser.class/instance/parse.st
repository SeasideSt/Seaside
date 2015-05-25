parsing
parse
	| result |
	result := self whitespace; parseValue.
	self whitespace.
	stream atEnd
		ifFalse: [ self error: 'end of input expected' ].
	^ result