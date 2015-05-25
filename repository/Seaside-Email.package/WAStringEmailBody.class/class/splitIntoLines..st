private
splitIntoLines: aString
	^ Array streamContents: [ :stream |
		| cr start |
		cr := Character cr.
		start := 1.
		1 to: aString size do: [ :index |
			(aString at: index) = cr ifTrue: [
				stream nextPut: (aString copyFrom: start to: index - 1).
				start := index + 1 ] ].
			start <= (aString size + 1) ifTrue: [ 
				stream nextPut: (aString copyFrom: start to: aString size) ] ]