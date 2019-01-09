initialization
initialize
	super initialize.
	self matcher
		matchesAnyOf: (WASlime callbackSelectors
			collect: [ :each | '`html `msg' , (self genericPatternForSelector: each) ])
		do: [ :node :answer |
			(answer isNil and: [ WASlime isBrushSelector: node receiver selector ]) 
				ifTrue: [
					node arguments
						detect: [ :each | each isBlock and: [ each body statements size > 1 ] ]
						ifNone: [ answer ] ]
				ifFalse: [ answer ] ]