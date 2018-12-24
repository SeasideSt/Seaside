initialization
initialize
	super initialize.
	self matcher
		matches: '`html `msg with: ``@arg'
		do: [ :node :answer |
			(answer isNil
				and: [ (node parent isCascade not)
				and: [ (WASlime isBrushSelector: node receiver selector)
				and: [ (WASlime isBrushSelector: node receiver selector , ':')
				and: [ (WASlime isBrushSelector: node methodNode selector) not ] ] ] ])
					ifTrue: [ node ]
					ifFalse: [ answer ] ]