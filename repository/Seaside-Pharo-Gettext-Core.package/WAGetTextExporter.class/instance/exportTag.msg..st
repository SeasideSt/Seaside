exporting
exportTag: tag msg: aString

	| pos end line |
	(aString indexOf: Character lf) = 0
		ifTrue: [ self exportTag: tag singleLine: aString ]
		ifFalse: [ 
			self exportTag: tag singleLine: ''.
			"The string has an LF character. Process the string per LF"
			pos := 1.
			end := 0.
			[ end < aString size ] whileTrue: [ 
				end := aString indexOf: Character lf startingAt: pos.
				end = 0 ifTrue: [ end := aString size ].
				line := aString copyFrom: pos to: end.
				stream
					nextPut: $";
					nextPutAll: (self formatString: line);
					nextPut: $";
					lf.
				pos := end + 1 ] ]