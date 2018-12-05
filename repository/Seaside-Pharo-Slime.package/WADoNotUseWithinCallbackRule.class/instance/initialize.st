initialization
initialize
	super initialize.
	matcher := RBParseTreeSearcher new.
	matcher 
		matchesAnyOf: (self selectors
			collect: [ :each | '``@receiver' , (self genericPatternForSelector: each) ])
		do: [ :node :answer | 
			(WASlime isWithinCallback: node)
				ifTrue: [ answer add: node ].
			answer ]