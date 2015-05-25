parsing
parsePath: aString
	| p index |
	(aString notEmpty and: [ aString first = $/ ]) ifTrue: [
		path := nil.
		pathParameters := nil ].
	p := self path.
	index := p size.
	self pathElementsIn: aString do: [ :each |
		index := index + 1.
		each = '..'
			ifTrue: [
				p isEmpty ifFalse: [
					p removeLast ] ]
			ifFalse: [
				each = '.' ifFalse: [
					| semiColonIndex |
					semiColonIndex := each indexOf: $;.
					semiColonIndex = 0
						ifTrue: [
							"we don't have path parameters (default case), add the whole element"
							p addLast: (self decode: each) ]
						ifFalse: [
							"we do have path parameters, only add up to $; and the parse the parameters"
							p addLast: (self decode: (each copyFrom: 1 to: semiColonIndex - 1)).
							self parsePathParametersAt: index in: (each copyFrom: semiColonIndex to: each size) ] ] ] ].
	slash := aString notEmpty and: [ aString last = $/ ]