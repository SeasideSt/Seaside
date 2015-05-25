initialization
initialize
	super initialize.
	self matcher
		matches: '`@object renderContentOn: `@html'
		do: [ :node :answer |
			(answer isNil
				and: [ (node methodNode selector ~= #visitPainter:)
				and: [ (node receiver isVariable and: [ node receiver name = 'super' ]) not ] ])
					ifTrue: [ node ]
					ifFalse: [ answer ] ]