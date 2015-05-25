initialization
initialize
	super initialize.
	matcher := RBParseTreeSearcher new.
	matcher 
		matchesAnyOf: (self selectors
			collect: [ :each | 'self' , (self genericPatternForSelector: each) ])
		do: [ :node :answer |
			(WASlime isWithinCallback: node)
				ifFalse: [ answer add: node ].
			answer ]