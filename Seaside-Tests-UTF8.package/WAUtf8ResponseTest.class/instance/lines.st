private
lines
	"Answer the response as an array of lines, to be used within the tests."
	| result stream |
	result := OrderedCollection new.
	stream := self contents readStream.
	[ stream atEnd ] whileFalse: 
		[ result add: (stream greaseUpToAll: (String 
					with: Character cr
					with: Character lf)) ].
	^ result asArray