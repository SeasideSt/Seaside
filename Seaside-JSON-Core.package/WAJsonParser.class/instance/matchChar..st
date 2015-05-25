private
matchChar: aChar
	" Tries to match the character, consume input and answer true if successful."
	self whitespace.
	(stream atEnd or: [ stream peek ~= aChar ]) ifTrue: [ ^false ].
	stream next.
	^true