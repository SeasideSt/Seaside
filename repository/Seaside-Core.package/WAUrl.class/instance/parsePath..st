parsing
parsePath: aString
	| absolute |
	absolute := aString notEmpty and: [ aString first = $/ ].
	self
		parsePath: aString
		absolute: absolute
		from: (absolute ifTrue: [ 2 ] ifFalse: [ 1 ])
		to: aString size + 1