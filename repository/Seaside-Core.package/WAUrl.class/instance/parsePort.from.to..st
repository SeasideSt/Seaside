parsing
parsePort: aString from: start to: end
	| number |
	number := nil.
	start to: end - 1 do: [ :i |
		| char |
		char := aString at: i.
		(char < $0 or: [ char > $9 ]) ifTrue: [
			WAInvalidUrlSyntaxError signal: aString ].
		number := (number isNil  ifTrue: [ 0 ] ifFalse: [ 10 * number ])
			+ (char greaseInteger - $0 greaseInteger) ].
	^ number