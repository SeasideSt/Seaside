parsing-internal
parseString
	| result |
	self expectChar: $".
	result := WriteStream on: String new.
	[ stream atEnd or: [ stream peek = $" ] ] 
		whileFalse: [ result nextPut: self parseCharacter ].
	^ self expectChar: $"; createString: result contents