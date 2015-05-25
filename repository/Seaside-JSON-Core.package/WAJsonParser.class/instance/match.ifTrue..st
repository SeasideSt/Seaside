private
match: aString ifTrue: aBlock
	" Tries to match the string, consume input and answer the value of the block if true."
	self whitespace.
	aString do: [ :each |
		(stream atEnd or: [ each ~= stream next ]) ifTrue: [ self error: aString , ' expected' ] ].
	aBlock value